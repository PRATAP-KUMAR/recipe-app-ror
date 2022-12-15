Rails.application.routes.draw do
  devise_for :users
  root "user#index"
  resources :user, only: [:index] do
    resources :food, only: [:index, :new, :create, :destroy]
    resources :recipe, only: [:index, :show, :new, :create, :destroy ]
  end
end
