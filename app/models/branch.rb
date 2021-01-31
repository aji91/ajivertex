class Branch < ApplicationRecord

	def full_address
		"#{address_1} #{address_2} #{city}"
	end
end
