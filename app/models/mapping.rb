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
        if receiver.available?
          marker.lat receiver.latitude
          marker.lng receiver.longitude
          marker.infowindow receiver.org_name
        else
          receiver
        end
      end
    end
  end
end
