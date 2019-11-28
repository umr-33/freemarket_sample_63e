class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show]
  def index
    @items = Item.limit(10)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    image_params[:image].each do |img|
      @item.images.create(image: img)
      # Image.create(image: img, user_id: @item.id)
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path, 'グループを更新しました'
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(
      :title, :description, :prefecture_id, :shipping_charger_id, :shipping_method_id,
      :days_to_ship_id, :item_status_id, :trade_method_id, :brand_id, :category_id).merge(user_id: current_user.id)
    
  end

  def image_params
    params.require(:item_images).permit(image: [])
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

