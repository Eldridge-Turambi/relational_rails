require 'rails_helper'

RSpec.describe 'drinks index page' do
  before :each do
    @fort_greene = Bar.create!(name: 'Fort Greene', employee_count: 20, license: true)
    @french_75 = Drink.create!(name: 'French 75', cost: 15, alcoholic_bev: true, bar_id: @fort_greene.id)
    @margarita = Drink.create!(name: 'Margarita', cost: 10, alcoholic_bev: true, bar_id: @fort_greene.id)
    @glühwein = Drink.create!(name: 'Glüwhein', cost: 5, alcoholic_bev: true, bar_id: @fort_greene.id)

    visit '/drinks'
  end

  it 'visits index page' do
    expect(current_path).to eq('/drinks')
  end

  it 'shows all drinks' do
    expect(page).to have_content(@french_75.name)
    expect(page).to have_content(@margarita.name)
    expect(page).to have_content(@glühwein.name)
    save_and_open_page
  end
end
