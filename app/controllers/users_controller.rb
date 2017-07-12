class UsersController < ApplicationController

  before_action :authenticate_user!,     only: :sell_list
  before_action :set_user_selling_items, only: [:show, :sell_list]

  def show
    set_follower
  end

  def sell_list
  end

  def buy_list
    set_user_bought_items
  end

private
  def user_params
    params.permit(:id)
  end

  def set_user_selling_items
    @user     = User.find(current_user.id)
    @items    = @user.items.each_slice(3).to_a
  end

  def set_user_bought_items
    buyers = Buyer.where(user_id:current_user.id)
    item_list = []
    buyers.each do |buyer|
      item_list << buyer.item
    end
    @items = item_list.each_slice(3).to_a
  end

  def set_follower
    @follower = Follower.where(user_id: current_user.id).find_by(followed_user_id: user_params[:id]) if user_signed_in?
  end
end
