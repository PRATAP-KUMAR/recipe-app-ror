require 'rails_helper'

RSpec.describe 'Recipe', type: :model do
  before(:each) do
    @user = User.create(
                       name: 'TEST',
                       email: 'test@email.com',
                       password: 'password'
                      )
    @recipe = Recipe.create(
                        user: @user,
                        name: 'RECIPE NAME',
                        preparation_time: 120,
                        cooking_time: 60,
                        public: true
                      )
  end
  context "test" do
    it "tests" do
      expect(@recipe.name).to eq('RECIPE NAME')
    end

    it "tests" do
      @recipe.public = false
      @recipe.save
      expect(@recipe.public).to eq(false)
    end
  end
end

