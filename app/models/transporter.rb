class Transporter < ActiveRecord::Base
  validates :cell_phone, presence: true, uniqueness: true

  belongs_to :user

  def self.available(transporter)
    ( Time.now.hour > transporter.open ) && ( Time.now.hour < transporter.close )
  end
end
