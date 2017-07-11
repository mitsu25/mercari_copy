class UsersController < ApplicationController

  before_action :authenticate_user!, only: :sell_list

  def show
    get_user_items(user_params[:id])
    @follower = Follower.where(user_id: current_user.id).find_by(followed_user_id: user_params[:id]) if user_signed_in?
  end

  def sell_list
    get_user_items(current_user.id)
    @items = @user.items.each_slice(3).to_a
  end

private
  def user_params
    params.permit(:id)
  end

  def get_user_items(id)
    @user     = User.find(id)
    @items    = @user.items.each_slice(3).to_a
  end
end
