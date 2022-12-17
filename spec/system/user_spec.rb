require 'rails_helper'

RSpec.describe 'Food and Recipes links on home page', type: :system do
  subject do
    @user = User.new(
      name: 'some_one',
      email: 'some_one@email.com',
      password: 'some_password'
    )

    @food = Food.create(user: @user, name: 'FOOD', measurement_unit: 'grams', price: 10)

    @recipe = Recipe.create(user: @user, name: 'RECIPE', preparation_time: 60, cooking_time: 30)
  end

  before do
    subject.save
    login_as(@user, scope: :user)
  end

  describe 'Root Page', js: true do
    it 'can see the email on root page' do
      visit food_index_path
      sleep(2)
      expect(page).to have_content(@user.email)
      expect(page).to have_link('FOODS')
      expect(page).to have_link('RECIPES')
    end
  end

  describe 'Food Index Page', js: true do
    it 'can see the New Food Link' do
      visit food_index_path
      sleep(2)
      expect(page).to have_content('New Food')
      expect(page).to have_link('New Food')
    end
  end

  describe 'Recipes Index Page', js: true do
    it 'can see the Add Recipe Link' do
      visit recipe_index_path(subject)
      sleep(2)
      expect(page).to have_content(@user.name)
      expect(page).to have_link('Add Recipe')
    end
  end
end
