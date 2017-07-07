class FollowersController < ApplicationController

  def index
    @user = User.find(current_user.id)
    followers = Follower.where(user_id:current_user.id)
    @items = []
    followers.each do |follower|
      @items << Item.where(user_id: follower.followed_user_id)
    end
  end

  def create
    @follower = Follower.new(user_id: follower_params[:user_id], followed_user_id: follower_params[:followed_user_id])
    if @follower.save
      respond_to do |format|
        format.json
      end
    end
  end


  def destroy
    @follower = Follower.find(follower_params[:id])
    @user     = User.find(follower_params[:followed_user_id])
    if @follower.destroy
      respond_to do |format|
        format.json
      end
    end
  end

  private
  def follower_params
    params.permit(:id, :user_id, :followed_user_id)
  end

end
