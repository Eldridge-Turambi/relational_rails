require 'rails_helper'
RSpec.describe 'Create  new Drink menu for a Bar' do

  it 'creates a new bar record' do
    fort_greene = Bar.create!(name: 'Fort Greene', employee_count: 20, license: true)
    visit "/bars/#{fort_greene.id}/drinks/new"

    fill_in("name", with: "Sazerac")
    fill_in("cost", with: 6)
    fill_in("alcoholic_bev", with: true)

    click_button("Create Drink")

    expect(current_path).to eq("/bars/#{fort_greene.id}/drinks")
    expect(page).to have_content("Sazerac")
  end
end
