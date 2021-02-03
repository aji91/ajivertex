class Country < ApplicationRecord
	scope :asc_order, -> { order(name: :asc) }
end
