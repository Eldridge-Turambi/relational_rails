require 'rails_helper'

RSpec.describe 'Venue id page' do
  # before :each do
  # #  @blue_bird = Venue.create!(name: 'Blue Bir', lights: true, capacity: 150)
  #   visit "/venues/#{@blue_bird.id}"
  #   click_link "Update Venue"
  # end

  it 'fills out form, hit submit and taken back to venue index' do
    blue_bird = Venue.create!(name: 'BLUE nir', lights: true, capacity: 500)
    visit "/venues/#{blue_bird.id}/edit"

    fill_in('name', with: "BLUE BIRD")
    fill_in('lights', with: "true")
    fill_in('capacity', with: "500")

    click_button('Update This Venue')
    expect(current_path).to eq("/venues/#{blue_bird.id}")
    expect(Venue.count).to eq(1)
    expect(page).to have_content("BLUE BIRD")
    expect(page).to have_content(true)
    expect(page).to have_content(500)
  end
end
