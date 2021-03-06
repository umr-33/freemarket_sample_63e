class CategoriesController < ApplicationController
  
  def index
    if params[:cat_id]
      @categories = Category.find(params[:cat_id]).children
    end
  end

  def show
    @category = Category.find(params[:id])
    @category.update(items_size: @category.items.size)
  end
end
