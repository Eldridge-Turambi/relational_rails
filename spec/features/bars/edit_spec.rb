require 'rails_helper'

RSpec.describe 'bars index page' do
  it 'links to an update form' do
    fort_greene = Bar.create!(name: 'Fort Greene', employee_count: 20, license: true)

    visit "/bars/#{fort_greene.id}"

    click_link("Update Bar")

    expect(current_path).to eq("/bars/#{fort_greene.id}/edit")
  end

  it 'can create a new bar with attributes with a form' do
    fort_greene = Bar.create!(name: 'FortGreene', employee_count: 19, license: true)

    visit "/bars/#{fort_greene.id}/edit"
    #
    # expect(page).to have_content('FortGreene')
    # expect(page).to have_content(19)
    # expect(page).to have_content(true)

    # click_button("Edit FortGreene")

    fill_in("name", with: "Fort Greene")
    fill_in("employee_count", with: 10)
    fill_in("license", with: true)

    click_button("Update Bar")

    expect(current_path).to eq("/bars/#{fort_greene.id}")
    expect(page).to have_content("Fort Greene")
    expect(page).to have_content(10)
    expect(page).to have_content(true)
  end
end
