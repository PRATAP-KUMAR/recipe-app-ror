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
    @user = current_user
  end

  def create
    @user = current_user
    @recipe = @user.recipes.new(recipe_params)
    redirect_to user_recipe_index_path(user_id: current_user.id) if @recipe.save
  end

  def deestroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description)
  end
end
