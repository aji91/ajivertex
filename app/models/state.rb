class State < ApplicationRecord
	def self.ind_states
    	where(country_id: 375)
	end
end
