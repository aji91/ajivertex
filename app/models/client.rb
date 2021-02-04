class Client < ApplicationRecord
	belongs_to :state, optional: true
	belongs_to :country, optional: true
	scope :asc_order, -> { order(name: :asc) }

	def full_address
		"#{address_1}, #{address_2}"
	end
end
