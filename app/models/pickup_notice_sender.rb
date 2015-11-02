class PickupNotice
  def send_notice(contact_data)
    client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    message = client.account.messages.create from: ENV['TWILIO_SMS_NUMBER'], to: contact_data, body: pickup_data
  end

  def pickup_data
    "#WASTENOT has a pick-up! Are you available? #weblink here?"
  end
end
