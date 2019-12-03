class CategoriesController < ApplicationController
  
  def index
    if params[:cat_id]
      @categories = Category.find(params[:cat_id]).children
    end
  end


end
