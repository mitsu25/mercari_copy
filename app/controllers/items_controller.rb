class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    @items = Item.all.includes(:images).each_slice(4).to_a
  end

  def show
    @item = Item.find(params[:id])
    @prefecture = JpPrefecture::Prefecture.find code: @item.delivery_from
  end

  def new
    @item = Item.new
    @root_categories = RootCategory.all
  end

  def create
    @item  = Item.create(item_params)
    @image = Image.create(image_params(@item))
    redirect_to root_path
  end

  def buy
  end

  def finish
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :description, :brand, :sub_category_id, :status, :delivery_fee, :delivery_by, :delivery_from, :delivery_untill).merge(user_id:current_user.id)
  end

  def image_params(item)
    params.require(:item).permit(:image).merge(item_id:item.id)
  end
end
