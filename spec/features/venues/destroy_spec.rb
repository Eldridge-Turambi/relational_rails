require 'rails_helper'

RSpec.describe "Deletes Venue" do

  it "sees a link to delete venue, clicks it, and then goes to index and not see that venue there" do
    red_rocks = Venue.create!(name: 'Red Rocks', lights: true, capacity: 9545)

    visit "/venues/#{red_rocks.id}"

    click_link "Delete Venue"

    expect(current_path).to eq("/venues")
    expect(page).to_not have_content(red_rocks.name)
  end
end
