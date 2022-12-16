Rails.application.routes.draw do
  devise_for :users
  root "user#index"
  resources :user, only: [:index] do
    resources :food, only: [:index, :new, :create, :destroy]
    resources :recipe, only: [:index, :show, :new, :create, :destroy ] do
      resources :recipe_food, only: [:new, :edit, :create, :update, :destroy]
      end 
  end
end

