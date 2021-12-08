require 'rails_helper'

RSpec.describe 'Index page of venue_performer page' do
  before :each do
    @red_rocks = Venue.create!(name: 'Red Rocks', lights: true, capacity: 9545)

    @taylor_swift = Performer.create!(name: 'Taylor Swift', age: 31, repeater: true, venue_id: @red_rocks.id)
    @john_mayer = Performer.create!(name: 'John Mayer', age: 44, repeater: true, venue_id: @red_rocks.id)
  end

  it 'sees each performer and attributes that is associated with this venue' do
    visit "/venues/#{@red_rocks.id}/performers"

    expect(page).to have_content(@john_mayer.name)
    expect(page).to have_content(@taylor_swift.name)

    expect(page).to have_content(@john_mayer.age)
    expect(page).to have_content(@taylor_swift.age)

    expect(page).to have_content(@john_mayer.repeater)
    expect(page).to have_content(@taylor_swift.repeater)
  end

  it 'sees a link to create performer' do
    visit "/venues/#{@red_rocks.id}/performers"

    click_link "Create Performer"

    expect(current_path).to eq("/venues/#{@red_rocks.id}/performers/new")
  end

  it 'sees a link alphabetize performers' do
    visit "/venues/#{@red_rocks.id}/performers"

    click_link "Sort Alphabetically"

    expect(current_path).to eq("/venues/#{@red_rocks.id}/performers")
    expect(@john_mayer.name).to appear_before(@taylor_swift.name)
  end

  it 'sees a link to edit the performers' do
    visit "/venues/#{@red_rocks.id}/performers"

    click_link "Edit #{@taylor_swift.name}'s info"

    expect(current_path).to eq("/performers/#{@taylor_swift.id}/edit")
  end
end
