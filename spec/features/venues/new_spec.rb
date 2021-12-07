require 'rails_helper'

RSpec.describe 'Venue new page' do
  before :each do
    @blue_bird = Venue.create!(name: 'Blue Bird', lights: true, capacity: 150)
    visit '/venues/new'
  end

  it 'fill out form, hit submit and taken back to venue index' do
    fill_in "name", with: "red rocks"
    fill_in "lights", with: true
    fill_in "capacity", with: 1000

    click_button "Create Venue"

    expect(current_path).to eq("/venues")
    expect(Venue.count).to eq(2)
    expect(page).to have_content("red rocks")
    expect(page).to have_content(true)
    expect(page).to have_content(1000)
  end
end
