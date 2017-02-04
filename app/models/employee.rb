class Employee < ApplicationRecord
	belongs_to :gender
	belongs_to :religion
	belongs_to :position
	belongs_to :education
	belongs_to :gender
end
