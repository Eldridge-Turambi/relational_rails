require 'rails_helper'

RSpec.describe "Destroys Bar" do
  it 'sees a link to delete a bar' do
    fort_greene = Bar.create!(name: 'Fort Greene', employee_count: 20, license: true)

    visit "/bars/#{fort_greene.id}"

    click_link("Delete Bar")

    expect(current_path).to eq("/bars")
    expect(page).to_not have_content(fort_greene.name)
  end
end
