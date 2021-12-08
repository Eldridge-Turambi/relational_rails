require 'rails_helper'

RSpec.describe 'create a new performer for Venue' do
  before :each do
    @red_rocks = Venue.create!(name: 'Red Rocks', lights: true, capacity: 9545)
    @john_mayer = Performer.create!(name: 'John Mayer', age: 44, repeater: true, venue_id: @red_rocks.id)
  end

  it 'creates new performer record' do
    visit "venues/#{@red_rocks.id}/performers/new"

    fill_in "name", with: "Taylor Swift"
    fill_in "age", with: 31
    fill_in "repeater", with: true

    click_button "Create New Performer"

    expect(current_path).to eq("/venues/#{@red_rocks.id}/performers")
    expect(@red_rocks.performers.count).to eq(2)
    expect(page).to have_content("Taylor Swift")
  end
end
