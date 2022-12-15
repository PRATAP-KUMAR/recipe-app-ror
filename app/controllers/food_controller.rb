class FoodController < ApplicationController
  def index
    @foods = current_user.foods
  end

  def new
    @food = Food.new
  end

  def create
    @user = current_user
    @food = @user.foods.new(food_params)
    redirect_to user_food_index_path(user_id: current_user.id) if @food.save
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
