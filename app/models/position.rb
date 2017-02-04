class Position < ApplicationRecord
	belongs_to :department
	has_one :employees
end
