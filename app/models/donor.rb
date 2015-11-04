class Donor < ActiveRecord::Base
  has_many :donations

  def self.anonymous
    Donor.find_by(contact_name: "Anonymous")
  end
end
