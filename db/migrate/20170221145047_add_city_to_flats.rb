class AddCityToFlats < ActiveRecord::Migration[5.0]
  def change
    add_column :flats, :city, :string
  end
end
