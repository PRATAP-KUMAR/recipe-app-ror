class FoodController < ApplicationController
  def index
    @foods = current_user.foods
  end

  def new
    @food = Food.new
    @user = current_user
  end

  def create
    @user = current_user
    @food = @user.foods.new(food_params)
    redirect_to food_index_path(user_id: @user.id) if @food.save
  end

  def destroy
    @food = Food.find(params[:id]).destroy
    redirect_to food_index_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
