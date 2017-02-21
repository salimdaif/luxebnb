class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.integer :price
      t.text :desc
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end
