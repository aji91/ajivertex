class Country < ApplicationRecord
  def self.asc_order
    order(name: :asc)
  end
end
