require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    it 'checks for food/index' do
      get new_recipe_url
      expect(@respnose).to redirect_to('/users/sign_in')
    end
  end
end
