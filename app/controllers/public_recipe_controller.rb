class PublicRecipeController < ApplicationController
  def index
    @recipes = Recipe.includes(:recipe_foods).where(public: true).order(id: :desc)
  end
end
