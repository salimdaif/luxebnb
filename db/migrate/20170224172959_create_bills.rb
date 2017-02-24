class CreateBills < ActiveRecord::Migration[5.0]
  def change
    create_table :bills do |t|
      t.float :price, null: false, default: 0
      t.references :booking, foreign_key: true
      t.boolean :paid

      t.timestamps
    end
  end
end
