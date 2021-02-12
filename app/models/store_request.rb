class StoreRequest < ApplicationRecord
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user if controller }
  belongs_to :client
  belongs_to :vendor
  belongs_to :sale_order
  has_one :job_card
  has_one :invoice, through: :sale_order

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
    ee = StoreRequest.where("created_at >= ?", Time.now.beginning_of_year).last
    if ee && ee.code
      ss = ee.code.split('/')[2]
      "SR/#{Time.now.year}/#{ss.to_i + 1}"
    else
      "SR/#{Time.now.year}/1"
    end
  end

  def status
    approved? ? 'Approved' : rejected? ? 'Rejected' : '--'
  end
end
