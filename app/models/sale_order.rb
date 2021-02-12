class SaleOrder < ApplicationRecord
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user if controller }
  belongs_to :client
  belongs_to :vendor
  belongs_to :proforma
  has_one :store_request
  has_one :invoice
  has_many :selected_models, as: :modelable, dependent: :destroy
  validates :selected_models, :length => { :minimum => 1 }
  accepts_nested_attributes_for :selected_models, reject_if: :all_blank, allow_destroy: true

  scope :non_approvals, -> { where(approved: false, rejected: false) }
  
  def payment_status
    '--'
  end

  def addressed_user
    user = User.find_by_id(approved_by || rejected_by)
    user ? user.name : '--'
  end

  def addressed?
    approved? || rejected?
  end

  def new_code
    ee = SaleOrder.where("created_at >= ?", Time.now.beginning_of_year).last
    if ee && ee.code
      ss = ee.code.split('/')[2]
      "ORDER/#{Time.now.year}/#{ss.to_i + 1}"
    else
      "ORDER/#{Time.now.year}/1"
    end
  end

  def status
    approved? ? 'Approved' : rejected? ? 'Rejected' : '--'
  end
end
