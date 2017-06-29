class SubCategoriesController < ApplicationController
  def index
    @sub_categories = SubCategory.where(category_id:sub_category_params[:category_id])
    respond_to do |format|
      format.json
    end
  end

  private
  def sub_category_params
    params.permit(:category_id)
  end
end
