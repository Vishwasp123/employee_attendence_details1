class RemoveLatiLangInEmployeeTable < ActiveRecord::Migration[7.1]
  def change
    remove_column :employees, :latitude  
    remove_column :employees , :longitude
  end
end
