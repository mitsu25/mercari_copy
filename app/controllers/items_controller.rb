class ItemsController < ApplicationController

  def index
    @items = Item.all.includes(:images)
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item  = Item.create(item_params)
    @image = Image.create(image_params(@item))
    binding.pry
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
