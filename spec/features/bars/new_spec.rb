require 'rails_helper'

RSpec.describe 'Bar Creation' do

  it 'can create a new bar with attributes with a form' do
    visit '/bars/new'

    fill_in("name", with: "Brother's Bar")
    fill_in("employee_count", with: "30")
    fill_in("license", with: "true")

    click_button("Create Bar")

    expect(current_path).to eq("/bars")
    expect(page).to have_content("Brother's Bar")
    expect(page).to have_content("30")
    expect(page).to have_content("true")
  end
end
