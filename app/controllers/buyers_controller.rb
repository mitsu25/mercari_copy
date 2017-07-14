class BuyersController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_item,           only: [:new, :create]

  def index
    buyers = Buyer.where(user_id:buyer_params[:user_id])
    item_list = []
    buyers.each do |buyer|
      item_list << buyer.item
    end
    @items = item_list.each_slice(3).to_a
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
    item.update(stock_status:"sold")
  end
end
