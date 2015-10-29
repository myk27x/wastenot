class Transporter < ActiveRecord::Base
  validates :cell_phone, presence: true, uniqueness: true

  belongs_to :user
end
