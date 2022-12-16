Rails.application.routes.draw do
  devise_for :users
  root "user#index"
  get 'public_recipies', to: 'recipe#public_recipe'
  resources :user, only: [:index] do
    resources :food, only: [:index, :new, :create, :destroy]
    resources :recipe, only: [:index, :show, :new, :create, :destroy, :edit ] do
      resources :recipe_food, only: [:new, :edit, :create, :update, :destroy]
      end 
  end
end

