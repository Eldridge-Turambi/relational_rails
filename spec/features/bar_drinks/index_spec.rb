require "rails_helper"
RSpec.describe 'bar_drinks index page' do
  before :each do
    @fort_greene = Bar.create!(name: 'Fort Greene', employee_count: 20, license: true)
    @french_75 = Drink.create!(name: 'French 75', cost: 15, alcoholic_bev: true, bar_id: @fort_greene.id)
    @margarita = Drink.create!(name: 'Margarita', cost: 10, alcoholic_bev: true, bar_id: @fort_greene.id)
    @glühwein = Drink.create!(name: 'Glüwhein', cost: 5, alcoholic_bev: true, bar_id: @fort_greene.id)
    visit "/bars/#{@fort_greene.id}/drinks"
  end

  it 'sees each drink and associated attributes' do
    expect(page).to have_content(@french_75.name)
    expect(page).to have_content(@margarita.name)
    expect(page).to have_content(@french_75.cost)
    expect(page).to have_content(@margarita.cost)
    expect(page).to have_content(@french_75.alcoholic_bev)
    expect(page).to have_content(@margarita.alcoholic_bev)
  end

  it 'sees a link to create new drinks for bar' do
    click_link "Create Drink"

    expect(current_path).to eq("/bars/#{@fort_greene.id}/drinks/new")
  end

  xit 'clicks button to sort drinks alphabetically' do
    click_link "Sort Alphabetically"

    expect(current_path).to eq("/bars/#{@fort_greene.id}/drinks")
    expect(@french_75.name).to appear_before(@margarita.name)
    expect(@french_75.name).to appear_before(@glühwein.name)
    expect(@glühwein.name).to appear_before(@margarita.name)
  end
end
