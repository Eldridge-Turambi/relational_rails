require 'rails_helper'

RSpec.describe Performer do

  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:age)}
  #  it {should validate_presence_of(:repeater)}
  end

  describe 'relationships' do
    it {should belong_to(:venue)}
  end


  describe 'shows performers where boolean == true' do
    it 'Only shows repeater performers' do
      red_rocks = Venue.create!(name: 'Red Rocks', lights: true, capacity: 9545)
      taylor_swift = Performer.create!(name: 'Taylor Swift', age: 31, repeater: true, venue_id: red_rocks.id)
      john_mayer = Performer.create!(name: 'John Mayer', age: 44, repeater: true, venue_id: red_rocks.id)
      kesha = Performer.create!(name: 'Kesha', age: 34, repeater: false, venue_id: red_rocks.id)

      expect(Performer.repeated_performers).to eq([taylor_swift, john_mayer])
      expect(Performer.repeated_performers).to_not include([kesha])
    end

    it 'sorts performers alphabetically' do
      red_rocks = Venue.create!(name: 'Red Rocks', lights: true, capacity: 9545)

      taylor_swift = Performer.create!(name: 'Taylor Swift', age: 31, repeater: true, venue_id: red_rocks.id)
      john_mayer = Performer.create!(name: 'John Mayer', age: 44, repeater: true, venue_id: red_rocks.id)

      expect(Performer.alpha_sort).to eq([john_mayer, taylor_swift])
    end 
  end
end
