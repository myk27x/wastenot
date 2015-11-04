class Donation < ActiveRecord::Base
  belongs_to :donor

  geocoded_by      :address
  after_validation :geocode
end
