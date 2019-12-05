class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  def index
    @redy_items = Item.where("category_id >= 16 AND category_id < 213")
      .order("id DESC").limit(10)
    @mens_items = Item.limit(10)
      .where("category_id >= 213 AND category_id < 358")
      .order("id DESC").limit(10)
  end

  def new
    @item = Item.new
  end

  def create
    ActiveRecord::Base.transaction do
      @item = Item.new(item_params)
      if @item.save
        @item.category.update(items_size: @item.category.items.size)
        if params[:item_images]
          image_params[:image].each do |img|
            @item.images.create(image: img)
          end
        end
      else
        render :new
      end
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      @item.category.update(items_size: @item.category.items.size)
      if params[:item_images]
        image_params[:image].each do |img|
          @item.images.create(image: img)
        end
      end
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def  destroy
    if @item.destroy
      @item.category.update(items_size: @item.category.items.size)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(
      :title, :description, :prefecture_id, :shipping_charger_id, :shipping_method_id,
      :days_to_ship_id, :item_status_id, :brand_id, :category_id, :price
    ).merge( trade_status_id: 1, user_id: current_user.id)
  end

  def image_params
    params.require(:item_images).permit(image: [])
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

