class SelectedModel < ApplicationRecord
  belongs_to :modelable, polymorphic: true
  belongs_to :product_model

  after_create :update_pm
  after_update :update_pm

  def update_pm
    unless rate == product_model.price
      product_model.update_attribute(:price, rate)
    end
  end
end
