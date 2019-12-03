class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy]


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
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def  destroy
    if @item.destroy
        redirect_to root_path
    else
        render :edit
    end
  end

  def search
    @items = Item.search(params[:keyword])
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

