require 'rails_helper'

RSpec.describe 'drinks index page' do
  before :each do
    @fort_greene = Bar.create!(name: 'Fort Greene', employee_count: 20, license: true)
    @french_75 = Drink.create!(name: 'French 75', cost: 15, alcoholic_bev: true, bar_id: @fort_greene.id)
    @margarita = Drink.create!(name: 'Margarita', cost: 10, alcoholic_bev: true, bar_id: @fort_greene.id)
    @glühwein = Drink.create!(name: 'Glüwhein', cost: 5, alcoholic_bev: false, bar_id: @fort_greene.id)

    visit '/drinks'
  end

  it 'visits index page' do
    expect(current_path).to eq('/drinks')
  end

  it 'shows all drinks' do
    expect(page).to have_content(@french_75.name)
    expect(page).to have_content(@margarita.name)
    expect(page).to_not have_content(@glühwein.name)
  end

  it 'creates a new drink record' do
    visit '/bars'

    click_link("New Bar")

    expect(current_path).to eq('/bars/new')
  end

  describe "Destroys Drink" do
    it 'sees a link to delete a Drink' do
      fort_greene = Bar.create!(name: 'Fort Greene', employee_count: 20, license: true)

      glühwein = Drink.create!(name: 'Glüwhein', cost: 5, alcoholic_bev: true, bar_id: fort_greene.id)
      visit "/drinks"

      click_link("Delete #{glühwein.name}'s info")

      expect(current_path).to eq("/drinks")
      expect(page).to_not have_content(glühwein.name)
    end
  end
end
