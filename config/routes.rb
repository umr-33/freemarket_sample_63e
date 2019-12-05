Rails.application.routes.draw do
  

  devise_for :users, controllers: {
    omniauth_callbacks:  "users/omniauth_callbacks"
  }
  root to: "items#index"
  resources :items
  resources :users, only: [:index, :show, :new, :update, :edit] do
    collection do
      get "new1", to: "users#new1"
      get "new2", to: "users#new2"
      get "new3", to: "users#new3"
      get "new4", to: "users#new4"
      get "new5", to: "users#new5"
      get "logout", to: "users#logout"
      get "payment"
      get "identification"
      get "peyment"
    end
    member do
      get "listing"
      get 'confirmation'
    end
  end

  resources :cards, only: [:new, :create, :show, :destroy] do
    collection do
      post 'show'
    end
    #member do
      #get 'confirmation'
    #end
  end 

  resources :brands, only: [:index, :show]
end
