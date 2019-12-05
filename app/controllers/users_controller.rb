class UsersController < ApplicationController
  before_action :set_user,
    only: [:logout, :payment, :identification, :update, :new1, :show, :profile]

  def payment
    card = current_user.card
    if card
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def new1
    render "users/new/signin1"
  end
  def new2
    render "users/new/signin2"
  end
  def new3
    render "users/new/signin3"
  end
  def new4
    render "users/new/signin4"
  end
  def new5
    render "users/new/signin5"
  end
  def new
  end

  def create
  end

  def update
    if @user.update(user_params)
      redirect_to new2_users_path
    else
      render :new1
    end
  end
  def identification
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email,
     :family_name, :first_name, :family_name_kana, :first_name_kana,
     :birth_year, :birth_month, :birth_date)
  end

  def set_user
    @user = User.find(current_user.id)
  end
end
