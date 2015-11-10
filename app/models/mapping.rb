class Mapping

  def self.make_map_for(receiver, donation)
    if @receivers != nil
      procs = self.receivers_procs(receiver) + self.donations_procs(donation)
    else
      procs = self.donations_procs(donation)
    end

    Gmaps4rails.build_markers(procs) do |marker_proc, marker|
      marker_proc.call(marker)
    end
  end

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
