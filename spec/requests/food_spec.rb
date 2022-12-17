require 'rails_helper'

RSpec.describe 'Food', type: :request do
  describe 'test' do
    it 'checks for Food' do
      get food_index_url
      expect(@respnose).not_to redirect_to("/food/destroy")
    end
  end
end
