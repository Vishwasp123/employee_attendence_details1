class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.integer :radius

      t.timestamps
    end
  end
end
