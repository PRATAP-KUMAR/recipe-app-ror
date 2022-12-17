require 'rails_helper'

RSpec.describe 'Food', type: :feature do
  subject do
    @user = User.create!(name: 'Tom', email: "email@hmail.com", password: "password")
    Food.create!(name: "eggs", measurement_unit: "grams", price: 10, user_id: @user.id)
  end

  before(:each) { subject.save }

  it 'should be invalid without name' do
    subject.name = 'eggs'
    expect(subject).to be_valid
  end

  it 'should be invalid without name' do
    subject.price = 10
    expect(subject).to be_valid
  end
end
