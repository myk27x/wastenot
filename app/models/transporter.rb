class Transporter < ActiveRecord::Base
  validates :cell_phone, presence: true, uniqueness: true

  belongs_to :user

  def self.available(transporter)
    Time.now.hour.between?( transporter.open, transporter.close )
  end
end
