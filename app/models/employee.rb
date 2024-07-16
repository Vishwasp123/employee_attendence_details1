class Employee < ApplicationRecord
	validates :first_name , :last_name, :gender, :email_address, :phone_number, :address, :employee_id, :latitude, :longitude , presence: true

	has_many :attendences, dependent: :destroy
end
