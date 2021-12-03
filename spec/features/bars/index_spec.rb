require 'rails_helper'

RSpec.describe 'bars index page' do
  before :each do
    @monkey_bar = Bar.create!(name: 'Monkey Bar', employee_count: 10, license: true)
    @fort_greene = Bar.create!(name: 'Fort Greene', employee_count: 20, license: true)
    @gin_mill = Bar.create!(name: 'Gin Mill', employee_count: 30, license: true)
    visit '/bars'
  end

  it 'visits index page' do
    expect(current_path).to eq('/bars')
  end

  it 'shows all bars' do
    expect(page).to have_content(@monkey_bar.name)
    expect(page).to have_content(@fort_greene.name)
    expect(page).to have_content(@gin_mill.name)
    
  end
end
