require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  subject do
    @user = User.create!(name: 'Tom', email: 'email@hmail.com', password: 'password')
    @food = Food.create!(name: 'eggs', measurement_unit: 'grams', price: 10, user_id: @user.id)
    @recipe = Recipe.create!(name: 'recipe 1', preparation_time: 120, cooking_time: 60,
                             description: 'some good food to have', user_id: @user.id)

    RecipeFood.create!(quantity: 20, food_id: @food.id, recipe_id: @recipe.id)
  end

  it 'is not valid without a quantity' do
    subject.quantity = 20
    expect(subject).to be_valid
  end
end
