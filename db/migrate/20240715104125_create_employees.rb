class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :email_address
      t.string :phone_number
      t.string :address
      t.string :employee_id
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
