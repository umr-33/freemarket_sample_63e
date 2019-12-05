class BrandsController < ApplicationController
  def index
    @brands = Brand.search(params[:keyword])
  end
  def show
    @brand_cats = Brand.find(1).children
    @brand_cat = Brand.find(params[:id])
    if @brand_cat.parent_id == 1
      @abclist = Brand.new.abc_sort(@brand_cat)
    end
  end
end
