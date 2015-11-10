class Mapping

  def self.donations_procs(donations)
    donations.map do |donation|
      proc do |marker|
        marker.lat donation.latitude
        marker.lng donation.longitude
        marker.infowindow "PICK-UP LOCATION"
      end
    end
  end

  def self.receivers_procs(receivers)
    receivers.map do |receiver|
      proc do |marker|
        marker.lat receiver.latitude
        marker.lng receiver.longitude
        marker.infowindow receiver.org_name
      end
    end
  end
end
