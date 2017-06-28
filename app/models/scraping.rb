class Scraping

  def self.get_root_category
    root_category_names = []
    agent    = Mechanize.new
    page     = agent.get('https://www.mercari.com/jp/category/')
    elements = page.search('.category-list-individual-box-root-category-name h3')
    elements.each do |ele|
      puts ele
      root_category_names << ele.inner_text
    end
    save_root_categories(root_category_names)
  end

  def self.save_root_categories(names)
    names.each do |name|
      root_category = RootCategory.where(name: name).first_or_initialize
      root_category.save
    end
  end

  # カテゴリーのスクレイピング：roo_categoryごとに「.category-list-individual-box」で
  # セクションが組まれているので、セクションを取得し、変数idと一緒に各セクション内のカテゴリーが記載されているタグを処理する。
  def self.save_categories
    root_category = RootCategory.find(1)
    id = root_category.id

    agent = Mechanize.new
    page  = agent.get('https://www.mercari.com/jp/category/')
    sections = page.search(".category-list-individual-box")

    sections.each do |section|
      elements = section.search('.category-list-individual-box-sub-category-name h4')

      elements.each do |ele|
        Category.create(name: ele.inner_text, root_category_id:id)
      end

      id += 1
    end

  end


  def self.save_sub_categories
    agent = Mechanize.new
    page  = agent.get('https://www.mercari.com/jp/category/')

    # root_category毎の塊をsectionとして配列に入れる
    sections = page.search(".category-list-individual-box")
    root_category_id_count = 1

    # 各root_categoryのsectionに対して繰り返し処理
    sections.each do |section|

      # section内の各カテゴリーに対して対応するサブカテゴリーのボックスがあるのでそれぞれの配列順序が対応している
      # categries[0]に対してsub_category_divs[0]内のサブカテゴリーが所属している
      categories = Category.where(root_category_id:root_category_id_count)
      sub_category_divs = section.search('.category-list-individual-box-sub-sub-category-box')

      # countを増やしそれぞれの配列の要素が空になるまで繰り返し処理
      count = 0
      while true do
        # categoryに対応するsub_categoryを持つdivを取得する
        # sub_categoryが入っているdivから各sub_categoryのリンクを持つpタグの配列elementsを取得
        # 配列elementsの要素（pタグ）の繰り返し処理してテキストを抽出し、正規表現でサブカテゴリーのリンクの文字列のみを取得し変数nameに代入
        # サブカテゴリー内の「すべて」は保存しないのでif文でcreateをしないよう分岐
        category   = categories[count]
        target_div = sub_category_divs[count]
        elements   = target_div.search('.category-list-individual-box-sub-sub-category-name p')
        elements.each do |ele|
          name = ele.inner_text.gsub(/(\r\n|\r|\n|\s)/, "",)
          sub_category = SubCategory.create(name: name, category_id:category.id) if name != "すべて"
        end

        count += 1
        break unless categories[count]

      end

      root_category_id_count += 1
    end
  end

end

