class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, 
  :rememberable, :trackable, :validatable, authentication_keys: [:login]

  validates :email, uniqueness: true
  validates :username, uniqueness: true
  validates :employee_code, uniqueness: true

  belongs_to :branch
  belongs_to :department

  validates_length_of :mobile,  minimum: 10, maximum: 13
  validates_length_of :aadhar_no,  minimum: 12, maximum: 12
  validates_length_of :pan_no,  minimum: 10, maximum: 10
end
