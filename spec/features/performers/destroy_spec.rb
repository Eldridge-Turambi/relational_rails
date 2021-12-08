require 'rails_helper'

RSpec.describe "Deletes Performer" do

  it 'sees link to delete performer, clicks it, and is taken back to index' do
    blue_bird = Venue.create!(name: 'Blue Bird', lights: true, capacity: 150)
    kesha = Performer.create!(name: 'Kesha', age: 34, repeater: false, venue_id: blue_bird.id)
    visit "/performers/#{kesha.id}"

    click_link "Delete Performer"

    expect(current_path).to eq("/performers/")
    expect(page).to_not have_content(kesha.name)
  end
end
