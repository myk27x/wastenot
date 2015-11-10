module Mapping
  module_function

  def make_map_for(receiver, donation)
    procs = if receiver.empty?
              self.donations_procs(donation)
            else
              self.receivers_procs(receiver) + self.donations_procs(donation)
            end

    Gmaps4rails.build_markers(procs) do |marker_proc, marker|
      marker_proc.call(marker)
    end
  end

  def donations_procs(donations)
    donations.map do |donation|
      proc do |marker|
        marker.lat donation.latitude
        marker.lng donation.longitude
        marker.picture(url: "http://www.google.com/mapfiles/dd-start.png", width:32, height: 32)
        marker.infowindow "PICK-UP LOCATION"
      end
    end
  end

  def receivers_procs(receivers)
    receivers.map do |receiver|
      proc do |marker|
        marker.lat receiver.latitude
        marker.lng receiver.longitude
        marker.picture(url: "http://www.google.com/mapfiles/marker.png", width:32, height: 32)
        marker.infowindow %{#{receiver.org_name}<br><br>Open from: #{receiver.open}:00 a.m. - #{receiver.close - 12}:00 p.m.}
      end
    end
  end
end
