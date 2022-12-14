class FoodController < ApplicationController
  def index
    @foods = current_user.foods
  end
end
