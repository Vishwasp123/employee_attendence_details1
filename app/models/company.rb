class Company < ApplicationRecord
	validate :name
	has_many :employees, dependent: :destroy
end
