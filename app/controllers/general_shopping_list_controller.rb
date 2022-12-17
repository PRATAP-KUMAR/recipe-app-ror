class GeneralShoppingListController < ApplicationController
  before_action :set_recipe, only: [:index]
  before_action :set_user, only: [:index]

  def index
    @recipe_foods = @recipe.recipe_foods.includes(:food).order(:id)

    @missing_foods = @recipe_foods.select { |recipe_food| recipe_food.quantity.to_i > recipe_food.food.quantity }
    @missing_foods = @missing_foods.map do |recipe_food|
      {
        name: recipe_food.food.name,
        unit: recipe_food.food.measurement_unit,
        quantity: recipe_food.quantity.to_i - recipe_food.food.quantity,
        price: recipe_food.food.price * (recipe_food.quantity.to_i - recipe_food.food.quantity)
      }
    end

    @total_price = @missing_foods.map { |recipe_food| recipe_food[:price] }.sum
  end

  private

  def set_user
    @user = current_user
  end

  def set_recipe
    @recipe = set_user.recipes.find(params[:recipe_id])
  end
end
