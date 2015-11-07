class User < ActiveRecord::Base
  has_secure_password

  validates :email, :password, presence: true

  has_one  :receiver
  has_one  :donor
  has_one  :transporter
  has_many :donations, through: :donor
end
