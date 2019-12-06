class CardsController < ApplicationController


  before_action :get_payjp_info, only: [:new, :create, :delete]

  def new
    render :new, layout: "users"
  end
  
  def create
    puts "params[:'payjp-token'] = #{params[:'payjp-token']}"
    if params['payjp-token'].blank?
      redirect_to action: "show", id: current_user.id
    else
      customer = Payjp::Customer.create(
      # email: current_user.email,
      card: params['payjp-token'],
      # metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to payment_users_path
      else
        render :new, layout: "users"
      end
    end
  end

  def destroy
    card = current_user.card
    if card.present?
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to payment_users_path
  end

  private

  def get_payjp_info
    if true #Rails.env == 'development'
      # Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    else
      # Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
      Payjp.api_key = Rails.application.credentials.payjp["PAYJP_PRIVATE_KEY"]
    end
  end
end