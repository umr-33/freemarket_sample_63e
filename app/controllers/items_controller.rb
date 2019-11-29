class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    image_params[:image].each do |img|
      @item.images.create(image: img)
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

end

