require "rails_helper"
RSpec.describe 'drinks index page' do
  before :each do
    @fort_greene = Bar.create!(name: 'Fort Greene', employee_count: 20, license: true)
    @french_75 = Drink.create!(name: 'French 75', cost: 15, alcoholic_bev: true, bar_id: @fort_greene.id)
    @margarita = Drink.create!(name: 'Margarita', cost: 10, alcoholic_bev: true, bar_id: @fort_greene.id)
    @glühwein = Drink.create!(name: 'Glüwhein', cost: 5, alcoholic_bev: true, bar_id: @fort_greene.id)
  end

  it "visits show page" do
    visit "/drinks/#{@french_75.id}"

    expect(current_path).to eq("/drinks/#{@french_75.id}")
  end


  #   When I visit a Child Show page
  # Then I see a link to update that Child "Update Child"
  # When I click the link
  # I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
  # When I click the button to submit the form "Update Child"
  # Then a `PATCH` request is sent to '/child_table_name/:id',
  # the child's data is updated,
  # and I am redirected to the Child Show page where I see the Child's updated information

    it 'sees a link drink update' do
      visit "/drinks/#{@french_75.id}"

      click_link("Update Drink")

      expect(current_path).to eq("/drinks/#{@french_75.id}/edit")
    end
end
