class CreateVenues < ActiveRecord::Migration[5.2]
  def change
    create_table :venues do |t|
      t.string :name
      t.boolean :lights
      t.integer :capacity

      t.timestamps
    end
  end
end
