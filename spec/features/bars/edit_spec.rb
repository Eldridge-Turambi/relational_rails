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
  it 'links to an update form' do
    visit "/bars/#{@fort_greene.id}"

    click_link("Update Bar")

    expect(current_path).to eq("/bars/#{@fort_greene.id}/edit")
  end

  it 'can create a new bar with attributes with a form' do
    fort_greene = Bar.create!(name: 'FortGreene', employee_count: 19, license: true)

    visit "/bars/#{fort_greene.id}/edit"
    #
    # expect(page).to have_content('FortGreene')
    # expect(page).to have_content(19)
    # expect(page).to have_content(true)

    # click_button("Edit FortGreene")

    fill_in("name", with: "Fort Greene")
    fill_in("employee_count", with: 10)
    fill_in("license", with: true)

    click_button("Update Bar")

    expect(current_path).to eq("/bars/#{fort_greene.id}")
    expect(page).to have_content("Fort Greene")
    expect(page).to have_content(10)
    expect(page).to have_content(true)
  end
end
