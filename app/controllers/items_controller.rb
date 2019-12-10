class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :new, :destroy]

  def index
    @redy_items = Item.where("category_id >= 16 AND category_id < 213")
      .where(trade_status_id: 1)
      .order("id DESC").limit(10)
    @mens_items = Item.limit(10)
      .where("category_id >= 213 AND category_id < 358")
      .where(trade_status_id: 1)
      .order("id DESC").limit(10)
    
    @q = Item.ransack(params[:q])
  end

  def search
    @q = Item.ransack(params[:q])
    @items = @q.result()
    if params[:item] && params[:item][:brand_id]
      @items = @q.result().where(brand_id: params[:item][:brand_id])
    end
    if params[:category_ids]
      @items = @q.result().where(category_id: params[:category_ids])
    end
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
    if @item.user_id != current_user.id
      redirect_to root_path
    end
  end

  def show
    if ((@item.trade_status_id == 3 ) && (@item.buyer_id == current_user.id)) || (@item.trade_status_id == 1 ) 
      item_path
    else
      redirect_to root_path
    end
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
      redirect_to listing_user_path(current_user.id)
    else
      render :edit
    end
    if @item.user_id != current_user.id
      redirect_to root_path
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

