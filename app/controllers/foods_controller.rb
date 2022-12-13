class FoodsController < ApplicationController
  def Index
    @foods = current_user.foods
  end
end
