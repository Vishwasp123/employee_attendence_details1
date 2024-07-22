class AddReferenceCompanyInEmployeeTable < ActiveRecord::Migration[7.1]
  def change
    add_reference  :employees , :company, index: true
  end
end
