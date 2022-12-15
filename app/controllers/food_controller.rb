class FoodController < ApplicationController
  def index
    @foods = current_user.foods
  end

  def new
    @food = Food.new
  end

  # def create
  #   @post = Post.new()
  # end
end
