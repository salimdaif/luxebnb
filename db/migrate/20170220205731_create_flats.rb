class CreateFlats < ActiveRecord::Migration[5.0]
  def change
    create_table :flats do |t|
      t.text :desc
      t.integer :capacity
      t.integer :room_number
      t.integer :bed_number
      t.integer :bathroom_number
      t.integer :price_night
      t.string :title
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
