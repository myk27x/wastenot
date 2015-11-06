class Transporter < ActiveRecord::Base
  include OpenCloseHours
  validates :cell_phone, presence: true, uniqueness: true

  belongs_to :user
end
