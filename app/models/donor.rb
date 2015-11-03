class Donor < ActiveRecord::Base
  has_many :donations

  def self.anonymous
    Donor.find_by(name: "Anonymous")
  end
end
