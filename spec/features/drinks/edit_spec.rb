require 'rails_helper'

RSpec.describe 'Edit Drinks page' do
  it 'sees a form to update drinks' do
    fort_greene = Bar.create!(name: 'Fort Greene', employee_count: 20, license: true)
    french_75 = Drink.create!(name: 'french 75', cost: 14, alcoholic_bev: true, bar_id: fort_greene.id)

    visit "/drinks/#{french_75.id}/edit"

    fill_in "name", with: "French 75"
    fill_in "cost", with: 15
    fill_in "alcoholic_bev", with: true

    click_button "Update This Drink"

    expect(current_path).to eq("/drinks/#{french_75.id}")
    expect(page).to have_content("French 75")
  end
end
