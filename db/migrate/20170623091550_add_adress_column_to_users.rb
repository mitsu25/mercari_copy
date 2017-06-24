class AddAdressColumnToUsers < ActiveRecord::Migration[5.0]
  def change
      add_column :users, :family_name,      :string
      add_column :users, :first_name,       :string
      add_column :users, :family_name_kana, :string
      add_column :users, :first_name_kana,  :string
      add_column :users, :zip_code,         :string
      add_column :users, :prefecture,       :string
      add_column :users, :city,             :string
      add_column :users, :house_number,     :string
      add_column :users, :building,         :string
      add_column :users, :telephone,        :string
  end
end
