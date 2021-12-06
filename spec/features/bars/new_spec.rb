require 'rails_helper'

RSpec.describe 'Bar Creation' do

  # Then I am taken to '/parents/new' where I  see a form for a new parent record
  # When I fill out the form with a new parent's attributes:
  # And I click the button "Create Parent" to submit the form
  # Then a `POST` request is sent to the '/parents' route,
  # a new parent record is created,
  # and I am redirected to the Parent Index page where I see the new Parent displayed.
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
