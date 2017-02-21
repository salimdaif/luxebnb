class CreateAvailabilities < ActiveRecord::Migration[5.0]
  def change
    create_table :availabilities do |t|
      t.datetime :start_date
      t.datetime :end_time
      t.boolean :available
      t.references :flat, foreign_key: true

      t.timestamps
    end
  end
end



