class UsersController < ApplicationController

  def show
    @user = User.find(current_user.id)
  end

  def new1
    @user = User.find(current_user.id)
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
  def logout
    @user = User.find(current_user.id)
    render "users/logout"
  end
  def payment
    @user = User.find(current_user.id)
    render "users/payment"
  end
  def new
  end

  def create
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to new2_users_path
    else
      render :new1
    end
  end
  private
  def user_params
    params.require(:user).permit(:nickname, :email,
     :family_name, :first_name, :family_name_kana, :first_name_kana,
     :birth_year, :birth_month, :birth_date)
  end
end
