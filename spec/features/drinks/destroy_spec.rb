require 'rails_helper'

RSpec.describe "Destroys Drink" do
  it 'sees a link to delete a Drink' do
    fort_greene = Bar.create!(name: 'Fort Greene', employee_count: 20, license: true)

    french_75 = Drink.create!(name: 'French 75', cost: 15, alcoholic_bev: true, bar_id: fort_greene.id)
    visit "/drinks/#{french_75.id}"

    click_link("Delete Drink")

    expect(current_path).to eq("/drinks")
    expect(page).to_not have_content(french_75.name)
  end
end
