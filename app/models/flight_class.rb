class FlightClass < ApplicationRecord
	has_many :food_menus
	has_many :flight_type
end
