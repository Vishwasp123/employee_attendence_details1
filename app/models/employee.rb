class Employee < ApplicationRecord
	validates :first_name , :last_name, :gender, :email_address, :phone_number, :address, :employee_id, :password , presence: true

	 has_many :attendances, dependent: :destroy
	 belongs_to :company
end
