class UsersController < ApplicationController

  before_action :authenticate_user!,     only: :sell_list

  def show
    @user     = set_user
    @follower = set_follower
    @items    = @user.items.each_slice(3).to_a
  end

private
  def user_params
    params.permit(:id)
  end

  def set_user
    User.find(user_params[:id])
  end

  def set_follower
    Follower.where(user_id: current_user.id).find_by(followed_user_id: user_params[:id]) if user_signed_in?
  end
end
