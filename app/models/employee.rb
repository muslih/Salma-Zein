class Employee < ApplicationRecord
	belongs_to :gender_id
	belongs_to :religion_id
	belongs_to :position_id
	belongs_to :education_id
end
