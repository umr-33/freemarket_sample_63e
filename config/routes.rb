Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks:  "users/omniauth_callbacks"
  }
  root to: "items#index"
  resources :items
  resources :users, only: [:index, :show, :new] do
    collection do
      get "signup", to: "users#signup"
      get "new1", to: "users#new1"
      get "new2", to: "users#new2"
      get "new3", to: "users#new3"
      get "new4", to: "users#new4"
      get "new5", to: "users#new5"
      get "login", to: "users#login"
    end
  end
end
