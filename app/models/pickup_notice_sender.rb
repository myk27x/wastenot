# PickupNotice.send_notice("555-1212")
class PickupNoticeSender
  def self.send_notice(contact_data)
    client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']

    client.account.messages.create from: ENV['TWILIO_SMS_NUMBER'], to: contact_data, body: pickup_data
  end

  def self.pickup_data
    "#WASTENOT has a pick-up! Are you available? #weblink here?"
  end
end
# Transporter.all do |transporter|
#   PickupNotice.send_notice(transport.cell_phone)
# end



# notice = PickupNoticeGavin.new("555-1212")
# notice.send

# Transporter.all do |transporter|
#   notice = PickupNotice.new(transport.cell_phone)
#   notice.send
#
#    -- or --
#
#   PickupNotice.new(transporter.cell_phone).send
# end

class PickupNoticeGavin
  def initailize(contact_data)
    @contact_data = contact_data
  end

  def send
    client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    message = client.account.messages.create from: ENV['TWILIO_SMS_NUMBER'], to: @contact_data, body: pickup_data
  end

  private

  def pickup_data
    "#WASTENOT has a pick-up! Are you available? #weblink here?"
  end
end
