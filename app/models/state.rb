class State < ApplicationRecord
	scope :ind_states, -> { where(country_id: 375) }
end
