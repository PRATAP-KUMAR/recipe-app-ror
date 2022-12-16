Rails.application.routes.draw do
  devise_for :users
  root "user#index"
  get 'public_recipies', to: 'recipe#public_recipe'
  patch 'toggle/:id', to: 'recipe#toggle'
  resources :user, only: [:index] do
    resources :food, only: [:index, :new, :create, :destroy]
    resources :recipe, only: [:index, :show, :new, :create, :destroy, :edit, :update] do
      resources :recipe_food, only: [:new, :edit, :create, :update, :destroy]
      resources :general_shopping_list, only: [:index]
      end 
  end
end

