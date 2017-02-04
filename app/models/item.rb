class Item < ApplicationRecord
	belongs_to :item_category
	belongs_to :item_unit
	belongs_to :supplier
end
