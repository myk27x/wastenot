class Donation < ActiveRecord::Base
  belongs_to :donor

  validates :address, presence: true

  geocoded_by      :address
  after_validation :geocode
end
