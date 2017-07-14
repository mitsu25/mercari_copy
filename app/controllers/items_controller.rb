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
    @item       = Item.find(params[:id])
    @prefecture = JpPrefecture::Prefecture.find code: @item.delivery_from
  end

  def new
    @item            = Item.new
    @root_categories = RootCategory.all
  end

  def create
    @item  = Item.create(item_params)
    @image = Image.create(image_params(@item))
    redirect_to root_path
  end


  def search
    @keyword = search_params[:keyword]
    @items   = Item.where('name LIKE(?)', "%#{search_params[:keyword]}%").each_slice(4).to_a
  end

  private
  def item_params
    item_attr = [:name, :price, :description, :brand, :sub_category_id, :status, :delivery_fee, :delivery_by, :delivery_from, :delivery_untill]
    params.require(:item).permit(item_attr).merge(user_id:current_user.id)
  end

  def image_params(item)
    params.require(:item).permit(:image).merge(item_id:item.id)
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
end
