module OpenCloseHours
  def available?
     Time.now.hour.between?(self.open, self.close)
  end
end
