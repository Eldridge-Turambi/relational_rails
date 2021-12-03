require 'rails_helper'

RSpec.describe 'show page' do
  before :each do
    @red_rocks = Venue.create!(name: 'Red Rocks', lights: true, capacity: 9545)
    @blue_bird = Venue.create!(name: 'Blue Bird', lights: true, capacity: 150)
    @filmore = Venue.create!(name: 'The Filmore', lights: true, capacity: 1000)

    @taylor_swift = Performer.create!(name: 'Taylor Swift', age: 31, repeater: true, venue_id: @red_rocks.id)
    @john_mayer = Performer.create!(name: 'John Mayer', age: 44, repeater: true, venue_id: @red_rocks.id)
    @kesha = Performer.create!(name: 'Kesha', age: 34, repeater: true, venue_id: @blue_bird.id)
    visit "/performers/#{@kesha.id}"
  end

  it 'visits performer page' do
    expect(current_path).to eq("/performers/#{@kesha.id}")
  end
end
