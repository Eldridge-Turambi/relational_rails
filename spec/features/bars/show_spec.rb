require 'rails_helper'

RSpec.describe 'bars index page' do
  before :each do
    @monkey_bar = Bar.create!(name: 'Monkey Bar', employee_count: 10, license: true)
    @fort_greene = Bar.create!(name: 'Fort Greene', employee_count: 20, license: true)
    @gin_mill = Bar.create!(name: 'Gin Mill', employee_count: 30, license: true)
    visit "/bars/#{@monkey_bar.id}"
  end

  it "visits show page" do
    expect(current_path).to eq("/bars/#{@monkey_bar.id}")
  end
end
