class UsersController < ApplicationController

  def show
    @user = User.find(user_params[:id])
    @items = @user.items.each_slice(3).to_a
    @follower = Follower.where(user_id: current_user.id).find_by(followed_user_id: user_params[:id])
  end

private
  def user_params
    params.permit(:id)
  end
end
