class AddLatitudeAndLongitudeAttributesInAttdancesTable < ActiveRecord::Migration[7.1]
   def change
    add_column :attendances, :latitude, :float
    add_column :attendances, :longitude, :float
  end
end
