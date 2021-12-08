require 'rails_helper'

RSpec.describe Venue do

  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:capacity)}
  end

  describe 'relationships' do
    it {should have_many(:performers)}
  end

  it 'shows the count of performers' do
    red_rocks = Venue.create!(name: 'Red Rocks', lights: true, capacity: 9545)
    blue_bird = Venue.create!(name: 'Blue Bird', lights: true, capacity: 150)
    taylor_swift = Performer.create!(name: 'Taylor Swift', age: 31, repeater: true, venue_id: red_rocks.id)
    john_mayer = Performer.create!(name: 'John Mayer', age: 44, repeater: true, venue_id: red_rocks.id)
    kesha = Performer.create!(name: 'Kesha', age: 34, repeater: true, venue_id: blue_bird.id)

    expect(red_rocks.performer_count).to eq(2)
    expect(blue_bird.performer_count).to eq(1)
  end
end
