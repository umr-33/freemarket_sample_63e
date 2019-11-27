class UsersController < ApplicationController

  def show
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
  def login
    render "users/login"
  end
  
  def new
  end

  def create
  end
  
end
