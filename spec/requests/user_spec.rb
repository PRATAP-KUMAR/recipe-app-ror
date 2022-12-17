require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'test' do
    it 'checks for users' do
      get new_user_session_url
      expect(@respnose).to render_template(:new)
    end
  end
end
