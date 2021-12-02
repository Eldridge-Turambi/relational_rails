require 'rails_helper'

RSpec.describe Performer do

  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:age)}
    it {should validate_presence_of(:repeater)}
  end

  describe 'relationships' do
    it {should belong_to(:venue)}
  end
end
