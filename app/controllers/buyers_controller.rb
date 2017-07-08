class BuyersController < ApplicationController
  before_action :set_item, only: [:new, :create]

  def index
    buyers = Buyer.where(user_id:buyer_params[:user_id])
    @items = []
    buyers.each do |buyer|
      @items << Item.find(buyer.item_id)
    end
  end

  def new
    @buyer = Buyer.new
  end

  def create
    Buyer.create(buyer_params)
    change_item_stock_sold(@item)
  end

  private
  def buyer_params
    params.permit(:item_id).merge(user_id:current_user.id)
  end

  def set_item
    @item  = Item.find(buyer_params[:item_id])
  end

  def change_item_stock_sold(item)
    item.stock_status = "sold"
  end
end
