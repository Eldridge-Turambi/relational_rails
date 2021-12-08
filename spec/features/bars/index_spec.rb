require 'rails_helper'

RSpec.describe 'bars index page' do
  before :each do
    @monkey_bar = Bar.create!(name: 'Monkey Bar', employee_count: 10, license: true)
    @fort_greene = Bar.create!(name: 'Fort Greene', employee_count: 20, license: true)
    @gin_mill = Bar.create!(name: 'Gin Mill', employee_count: 30, license: true)
  end

  it 'visits index page' do
    visit '/bars'

    expect(current_path).to eq('/bars')
  end

  it 'shows all bars' do
    visit '/bars'

    expect(page).to have_content(@monkey_bar.name)
    expect(page).to have_content(@fort_greene.name)
    expect(page).to have_content(@gin_mill.name)
  end

  xit 'sorts using created_by timestamps' do
    visit '/bars'

    expect(@fort_greene.name).to appear_before(@monkey_bar.name)
    expect(@gin_mill.name).to appear_before(@fort_greene.name)
  end

  describe 'usability Iteration 1' do
    it 'shows drink link on every page' do
      visit '/bars'

      click_link('Drinks')

      expect(current_path).to eq('/drinks')
    end

    it 'shows bar link on every page' do
      visit '/bars'

      click_link('Bars')

      expect(current_path).to eq('/bars')
    end
  end

  it 'creates a new bar record' do
    visit '/bars'

    click_link("New Bar")

    expect(current_path).to eq('/bars/new')
  end

  it 'sees a link to edit the bar' do
    visit '/bars'

    click_link("Edit #{@fort_greene.name}'s Info")

    expect(current_path).to eq("/bars/#{@fort_greene.id}/edit")
  end
end
