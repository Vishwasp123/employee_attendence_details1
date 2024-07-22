class AddPasswordAttributesInEmployee < ActiveRecord::Migration[7.1]
  def change
    add_column :employees, :password, :string
  end
end
