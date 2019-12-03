class SearchesController < ApplicationController
  before_filter :set_search
  def index
    
    if params[:keyword]
      @items = Item.search(params[:keyword])
      @search = params[:keyword]
    end
    if params[:q]
      @q = Brand.ransack(params[:q])
      @brands = @q.result(distinct: true)
      @items = []
      @brands.each do |b|
        @items.concat(b.items) if b.items.length > 0
        p b.items
      end
      
    end
  end

  private
  def set_search
    @q = Brand.ransack(params[:q])
  end
end
