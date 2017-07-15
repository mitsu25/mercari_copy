class LikesController < ApplicationController

  before_action :authenticate_user!

  def index
    @items = set_liked_items
  end

  def create
    @like = Like.new(like_params)
    is_user_like?(@like)
    if @like.save
      respond_to do |format|
        format.json
      end
    end
  end

  def destroy
    @like = Like.find(like_params[:id])
    is_user_like?(@like)
    if @like.destroy
      respond_to do |format|
        format.json
      end
    end
  end


  private
  def like_params
    params.permit(:id,:item_id).merge(user_id:current_user.id)
  end

  def is_user_like?(like)
    render :root_path if like.user_id != current_user.id
    return
  end

  def set_liked_items
    likes     = Like.where(user_id: current_user.id)
    item_list = []

    likes.each do |like|
      item_list << like.item
    end

    item_list.each_slice(3).to_a
  end
end
