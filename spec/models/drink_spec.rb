require 'rails_helper'

RSpec.describe Drink do
  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:cost)}
  end

  describe 'relationships' do
    it {should belong_to(:bar)}
  end

  it 'shows the drinks that alcoholic_bev == true' do
    fort_greene = Bar.create!(name: 'Fort Greene', employee_count: 20, license: true)
    french_75 = Drink.create!(name: 'French 75', cost: 15, alcoholic_bev: true, bar_id: fort_greene.id)
    margarita = Drink.create!(name: 'Margarita', cost: 10, alcoholic_bev: true, bar_id: fort_greene.id)
    glühwein = Drink.create!(name: 'Glüwhein', cost: 5, alcoholic_bev: false, bar_id: fort_greene.id)

    expect(Drink.is_alcoholic).to eq([french_75, margarita])
    expect(Drink.is_alcoholic).to_not include([glühwein])
  end

  it 'sorts drinks alphabetically' do
    fort_greene = Bar.create!(name: 'Fort Greene', employee_count: 20, license: true)
    french_75 = Drink.create!(name: 'French 75', cost: 15, alcoholic_bev: true, bar_id: fort_greene.id)
    margarita = Drink.create!(name: 'Margarita', cost: 10, alcoholic_bev: true, bar_id: fort_greene.id)
    glühwein = Drink.create!(name: 'Glüwhein', cost: 5, alcoholic_bev: true, bar_id: fort_greene.id)

    expect(Drink.alpha_sort).to eq([french_75, glühwein, margarita])
  end
end
