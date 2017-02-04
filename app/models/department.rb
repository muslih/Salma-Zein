class Department < ApplicationRecord
	belongs_to :station
	has_many :positions
end
