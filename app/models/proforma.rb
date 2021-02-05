class Proforma < ApplicationRecord
  belongs_to :client
  belongs_to :estimate, optional: true
  has_many :selected_models, as: :modelable, dependent: :destroy
  accepts_nested_attributes_for :selected_models, reject_if: :all_blank, allow_destroy: true

  def payment_status
    '--'
  end

  def approved_user
    user = User.find_by_id(approved_by)
    user ? user.name : '--'
  end
end
