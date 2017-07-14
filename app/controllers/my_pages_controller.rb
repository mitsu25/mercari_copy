class MyPagesController < ApplicationController
    before_action :authenticate_user!,     only: [:index, :sell_list]

  def index
    @user  = set_current_user
  end

  def sell_list
    @user  = set_current_user
    @items = set_user_selling_items(@user)
  end

  def buy_list
    @items = set_user_bought_items
  end

  private
  def set_current_user
    User.find(current_user.id)
  end

  def set_user_selling_items(user)
    user.items.each_slice(3).to_a
  end

  def set_user_bought_items
    buyers    = Buyer.where(user_id:current_user.id)
    item_list = []

    buyers.each do |buyer|
      item_list << buyer.item
    end

    item_list.each_slice(3).to_a
  end

end
