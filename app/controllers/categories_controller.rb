class CategoriesController < ApplicationController
  def index
    @categories = Category.where(root_category_id:category_params[:root_category_id])
    respond_to do |format|
      format.json
    end
  end

  private
  def category_params
    params.permit(:root_category_id)
  end
end
