class User < ActiveRecord::Base
  has_secure_password
  
  has_one  :receiver
  has_one  :donor
  has_one  :transporter
  has_many :donations, through: :donor
end
