class AddVenueToPerformers < ActiveRecord::Migration[5.2]
  def change
    add_reference :performers, :venue, foreign_key: true
  end
end
