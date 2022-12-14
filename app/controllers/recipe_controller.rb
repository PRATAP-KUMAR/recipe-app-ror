class RecipeController < ApplicationController
  def index
    @recipes = current_user.recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
    @foods = current_user.foods
  end
end
