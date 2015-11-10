class Donation < ActiveRecord::Base
  belongs_to :donor

  validates :address, :instructions, presence: true

  geocoded_by      :address
  after_validation :geocode
end
