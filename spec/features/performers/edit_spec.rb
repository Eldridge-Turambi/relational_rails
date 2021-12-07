require 'rails_helper'

RSpec.describe "Edit page for performer(child)" do

  it 'sees a form to update performer' do
    filmore = Venue.create!(name: 'The Filmore', lights: true, capacity: 1000)
    kesha = Performer.create!(name: 'Ke$ha', age: 35, repeater: true, venue_id: filmore.id)

    visit "/performers/#{kesha.id}/edit"

    fill_in "name", with: "Kesha"
    fill_in "age", with: 34
    fill_in "repeater", with: true
    
    click_button "Update This Performer"

    expect(current_path).to eq("/performers/#{kesha.id}")
    expect(page).to have_content("Kesha")
  end
end
