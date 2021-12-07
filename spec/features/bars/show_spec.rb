require 'rails_helper'

RSpec.describe 'bars index page' do
  before :each do
    @monkey_bar = Bar.create!(name: 'Monkey Bar', employee_count: 10, license: true)
    @fort_greene = Bar.create!(name: 'Fort Greene', employee_count: 20, license: true)
    @gin_mill = Bar.create!(name: 'Gin Mill', employee_count: 30, license: true)
    @french_75 = Drink.create!(name: 'French 75', cost: 15, alcoholic_bev: true, bar_id: @fort_greene.id)
    @margarita = Drink.create!(name: 'Margarita', cost: 10, alcoholic_bev: true, bar_id: @fort_greene.id)
    @glühwein = Drink.create!(name: 'Glüwhein', cost: 5, alcoholic_bev: true, bar_id: @monkey_bar.id)
  end

  it "visits show page" do
    visit "/bars/#{@monkey_bar.id}"

    expect(current_path).to eq("/bars/#{@monkey_bar.id}")
  end

  it 'links to drinks by bar id' do
    visit "/bars/#{@fort_greene.id}"

    click_link "#{@fort_greene.name}'s Drinks Here"

    expect(current_path).to eq("/bars/#{@fort_greene.id}/drinks")
  end

end
