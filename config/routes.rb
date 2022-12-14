Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "user#index"
  get "food/index", to: "food#index"
  get "recipe/index", to: "recipe#index"
end
