class RecipeController < ApplicationController
  def index
    @recipes = current_user.recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = @recipe.recipe_foods
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

  def destroy
    @recipe = Recipe.find(params[:id]).destroy
    redirect_to user_recipe_index_path
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    
    # @recipe = Recipe.find(params[:id])
    # if @recipe.update(recipe_params)
    #   flash[:success] = 'Recipe food was successfully updated.'
    #   redirect_to user_recipe_path(current_user, @recipe)
    # else
    #   render :edit, status: :unprocessable_entity
    # end
    @recipe = Recipe.find(params[:id])
    @recipe.public = !@recipe.public
    @recipe.save
    redirect_to user_recipe_path(current_user, @recipe)
  end

  def toggle
    @recipe = Recipe.find(params[:id])
    @recipe.public = !@recipe.public
    redirect_to user_recipe_path(current_user, @recipe)
  end

  def public_recipe
    @recipies = Recipe.where(public: true).includes(:user)
    @total_price = 0
    @recipies.each do |recipe|
      recipe.recipe_foods.each do |recipe_food|
        @total_price += recipe_food.food.price
      end
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
