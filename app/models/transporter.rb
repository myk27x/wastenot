class Transporter < ActiveRecord::Base
  validates :cell_phone,   presence: true, uniqueness: true, length: { is: 10 }
  validates :cell_carrier, presence: true
end
