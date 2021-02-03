class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, 
  :rememberable, :trackable, :validatable, authentication_keys: [:login]

  validates :email, uniqueness: true
  validates :username, uniqueness: true
  validates :employee_code, uniqueness: true

  belongs_to :role, optional: true
  belongs_to :branch, optional: true
  belongs_to :department, optional: true

  validates_length_of :mobile,  minimum: 10, maximum: 13
  validates_length_of :aadhar_no,  minimum: 12, maximum: 12
  validates_length_of :pan_no,  minimum: 10, maximum: 10
  
  mount_uploader :aadhar_file, ImageUploader
  mount_uploader :pan_file, ImageUploader

  attr_accessor :login

  def self.find_for_database_authentication warden_condition
    conditions = warden_condition.dup
    login = conditions.delete(:login)
    where(conditions).where(
      ["lower(username) = :value OR lower(email) = :value",
      { value: login.strip.downcase}]).first
  end

  def active_for_authentication?
    super && active?
  end
end
