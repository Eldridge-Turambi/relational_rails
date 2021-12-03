require 'rails_helper'

RSpec.describe 'Performers index' do
  before :each do
    @red_rocks = Venue.create!(name: 'Red Rocks', lights: true, capacity: 9545)
    @blue_bird = Venue.create!(name: 'Blue Bird', lights: true, capacity: 150)
    @filmore = Venue.create!(name: 'The Filmore', lights: true, capacity: 1000)
    @taylor_swift = Performer.create!(name: 'Taylor Swift', age: 31, repeater: true, venue_id: @red_rocks.id)
    @john_mayer = Performer.create!(name: 'John Mayer', age: 44, repeater: true, venue_id: @red_rocks.id)
    @kesha = Performer.create!(name: 'Kesha', age: 34, repeater: true, venue_id: @blue_bird.id)
    visit '/performers'
  end

  it 'visits index page' do
    expect(current_path).to eq('/performers')
  end

  it 'shows all performers' do
    expect(page).to have_content(@taylor_swift.name)
    expect(page).to have_content(@john_mayer.name)
    expect(page).to have_content(@kesha.name)

    expect(page).to have_content(@taylor_swift.age)
    expect(page).to have_content(@john_mayer.age)
    expect(page).to have_content(@kesha.age)

    expect(page).to have_content(@taylor_swift.repeater)
    expect(page).to have_content(@john_mayer.repeater)
    expect(page).to have_content(@kesha.repeater)
  end

end
