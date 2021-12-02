class CreateBars < ActiveRecord::Migration[5.2]
  def change
    create_table :bars do |t|
      t.string :name
      t.integer :employee_count
      t.boolean :license

      t.timestamps
    end
  end
end
