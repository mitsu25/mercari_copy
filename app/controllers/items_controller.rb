class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def index
    if user_signed_in?
      @items = set_all_items_without_my_items
    else
      @items = set_all_items
    end
  end

  def show
    @item         = Item.find(params[:id])
    @like         = set_like
    @prefecture   = JpPrefecture::Prefecture.find code: @item.delivery_from
  end

  def new
    @item            = Item.new
    @image           = @item.images.build
    @root_categories = RootCategory.all
  end

  def create
    @item  = Item.create(item_create_params)
    images = get_images
    images.each do |image|
      @image = @item.images.create!(image: image, item_id: @item.id )
    end
    redirect_to root_path
  end


  def search
    @keyword = search_params[:keyword]
    @items   = Item.where('name LIKE(?)', "%#{search_params[:keyword]}%").each_slice(4).to_a
  end

  private
  def item_params
    item_attr = [:name, :price, :description, :brand, :sub_category_id, :status, :delivery_fee,
                 :delivery_by, :delivery_from, :delivery_untill,
                 images_attributes:[:id, :item_id, :image]]
    params.require(:item).permit(item_attr).merge(user_id:current_user.id)
  end

  def item_create_params
    item_attr = [:name, :price, :description, :brand, :sub_category_id, :status, :delivery_fee,
                 :delivery_by, :delivery_from, :delivery_untill]
    params.require(:item).permit(item_attr).merge(user_id:current_user.id)
  end

  def image_params(item)
    params.require(:item).permit(:image).merge(item_id:item.id)
  end

  def get_images
    params.require(:item).require(:images_attributes).require("0").require(:image)
  end

  def search_params
    params.permit(:keyword)
  end

  def set_all_items
    Item.all.includes(:images).each_slice(4).to_a
  end

  def set_all_items_without_my_items
    Item.where.not(user_id:current_user.id).includes(:images).each_slice(4).to_a
  end

  def set_like
    Like.where(user_id:current_user.id).find_by(item_id:params[:id]) if user_signed_in?
  end

end
