require 'rails_helper'

RSpec.describe Bar do

  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:employee_count)}
    it {should validate_presence_of(:license)}
  end

  describe 'relationships' do
    it {should have_many(:drinks)}
  end
end
