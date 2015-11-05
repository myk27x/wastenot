class Receiver < ActiveRecord::Base
  include OpenCloseHours
  belongs_to :user

  geocoded_by      :street_address
  after_validation :geocode
end
