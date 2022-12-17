Rails.application.routes.draw do
  devise_for :users
  root "food#index"
  resources :food, only: [:index, :new, :create, :destroy]
  resources :recipe, only: [:index, :show, :new, :create, :destroy, :update] do
      resources :recipe_food, only: [:new, :create, :destroy, :update, :edit]
  end 
  resources :public_recipe, only: [:index]
  resources :general_shopping_list, only: [:index]
end
