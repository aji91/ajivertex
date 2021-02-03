class Tax < ApplicationRecord
	scope :cgst, -> { where("name LIKE ?", "CGST%") }
	scope :sgst, -> { where("name LIKE ?", "SGST%") }
end
