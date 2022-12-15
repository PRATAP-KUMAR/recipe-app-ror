class RecipeController < ApplicationController
  def index
    @recipes = current_user.recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
    @foods = current_user.foods
  end

  def new
    @recipe = Recipe.new
  end

  # def create
  #   @recipe = Recipe.new()
  # end
end
