class Estimate < ApplicationRecord
  belongs_to :client
  has_many :selected_models, dependent: :destroy
  validates :selected_models, :length => { :minimum => 1 }
  accepts_nested_attributes_for :selected_models, reject_if: :all_blank, allow_destroy: true

  def payment_status
    '--'
  end

  def approved_user
    user = User.find_by_id(approved_by)
    user ? user.name : '--'
  end
end
