require 'rails_helper'

RSpec.describe 'venues index page' do
  before :each do
    @red_rocks = Venue.create!(name: 'Red Rocks', lights: true, capacity: 9545)
    @blue_bird = Venue.create!(name: 'Blue Bird', lights: true, capacity: 150)
    @filmore = Venue.create!(name: 'The Filmore', lights: true, capacity: 1000)
    visit '/venues'
  end

  it 'visits index page' do
    expect(current_path).to eq('/venues')
  end

  it 'shows all venues' do
    expect(page).to have_content(@red_rocks.name)
    expect(page).to have_content(@blue_bird.name)
    expect(page).to have_content(@filmore.name)
  end

  describe 'usability Iteration 1' do
    it 'shows performer link on every page' do
      visit '/venues/'

      click_link('Performers')

      expect(current_path).to eq('/performers')
    end

    it 'shows venue link on every page' do
      visit '/performers/'

      click_link('Venues')

      expect(current_path).to eq('/venues')
    end

    it 'sees link to create Venue record' do
      visit '/venues'

      click_link("New Venue")

      expect(current_path).to eq('/venues/new')
    end

    it 'sees link to edit parent(venue) info on all instances off parent' do
      click_link "Edit #{@blue_bird.name}'s info"
      expect(current_path).to eq("/venues/#{@blue_bird.id}/edit")
    end
  end
end
