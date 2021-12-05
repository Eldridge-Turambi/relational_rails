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

  it 'counts the drinks available' do
    @monkey_bar = Bar.create!(name: 'Monkey Bar', employee_count: 10, license: true)
    @fort_greene = Bar.create!(name: 'Fort Greene', employee_count: 20, license: true)
    @french_75 = Drink.create!(name: 'French 75', cost: 15, alcoholic_bev: true, bar_id: @fort_greene.id)
    @margarita = Drink.create!(name: 'Margarita', cost: 10, alcoholic_bev: true, bar_id: @fort_greene.id)
    @glühwein = Drink.create!(name: 'Glüwhein', cost: 5, alcoholic_bev: true, bar_id: @monkey_bar.id)

    expect(@fort_greene.drinks_count).to eq(2)
    expect(@monkey_bar.drinks_count).to eq(1)
  end
end
