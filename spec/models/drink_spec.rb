require 'rails_helper'

RSpec.describe Drink do
  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:cost)}
    it {should validate_presence_of(:alcoholic_bev)}
  end

  describe 'relationships' do
    it {should belong_to(:bar)}
  end
end
