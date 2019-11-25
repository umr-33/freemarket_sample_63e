Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks:  "users/omniauth_callbacks"
  }
  root to: "items#index"
  resources :items
  resources :users, only: [:index, :show, :new]
end
