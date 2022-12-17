require 'rails_helper'

RSpec.describe 'RecipeFood', type: :request do
  describe 'test' do
    it 'checks for RecipeFood' do
      get new_recipe_recipe_food_url(1)
      expect(@respnose).to redirect_to("/users/sign_in")
    end
  end
end