class PurchasesController < ApplicationController
  before_action :set_item
  require 'payjp'

  def index

    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to controller: "cards", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
      render :index, layout: "users"
    end
  end
  
  def pay

    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    customer = Payjp::Customer.retrieve(card.customer_id)
    
    Payjp::Charge.create(
      :amount => @item.price,
      :customer => card.customer_id,
      :currency => 'jpy',
    )
    @item.update(trade_status_id: 3, buyer_id: current_user.id)
    redirect_to action: 'done' 
  end

  def done
    
    render :done, layout: "users"
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end
end
