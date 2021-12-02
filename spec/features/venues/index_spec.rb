require 'rails_helper'

RSpec.describe 'venues index page' do
  before :each do
    @red_rocks = Venue.create!(name: 'Red Rocks', lights: true, capacity: 9545)
    @blue_bird = Venue.create!(name: 'Blue Bird', lights: true, capacity: 150)
    @filmore = Venue.create!(name: 'The Filmore', lights: true, capacity: 1000)
    visit '/venues'
  end

  it 'visits index page' do
    expect(current_path).to eq('/venues')
  end

  it 'shows all venues' do
    expect(page).to have_content(@red_rocks.name)
    expect(page).to have_content(@blue_bird.name)
    expect(page).to have_content(@filmore.name)
  end
end
