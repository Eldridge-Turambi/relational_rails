require 'rails_helper'

RSpec.describe 'Index page of venue_performer page' do
  before :each do
    @red_rocks = Venue.create!(name: 'Red Rocks', lights: true, capacity: 9545)

    @taylor_swift = Performer.create!(name: 'Taylor Swift', age: 31, repeater: true, venue_id: @red_rocks.id)
    @john_mayer = Performer.create!(name: 'John Mayer', age: 44, repeater: true, venue_id: @red_rocks.id)
  end

  # As a visitor
  # When I visit '/parents/:parent_id/child_table_name'
  # Then I see each Child that is associated with that Parent with each Child's attributes:
  it 'sees each performer and attributes that is associated with this venue' do
    visit "/venues/#{@red_rocks.id}/performers"

    expect(page).to have_content(@john_mayer.name)
    expect(page).to have_content(@taylor_swift.name)

    expect(page).to have_content(@john_mayer.age)
    expect(page).to have_content(@taylor_swift.age)

    expect(page).to have_content(@john_mayer.repeater)
    expect(page).to have_content(@taylor_swift.repeater)
  end
end