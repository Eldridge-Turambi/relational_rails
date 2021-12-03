require 'rails_helper'

RSpec.describe 'Venue id page' do
  before :each do
    @red_rocks = Venue.create!(name: 'Red Rocks', lights: true, capacity: 9545)
    @blue_bird = Venue.create!(name: 'Blue Bird', lights: true, capacity: 150)
    @filmore = Venue.create!(name: 'The Filmore', lights: true, capacity: 1000)
    visit "/venues/#{@red_rocks.id}"
  end

  it 'shows attributes of the venue' do
    expect(current_path).to eq("/venues/#{@red_rocks.id}")
  end
end
