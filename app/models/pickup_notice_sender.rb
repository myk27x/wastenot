class PickupNoticeSender
  def notify(contact_data, pickup_data)
    client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    message = client.account.messages.create from: ENV['TWILIO_SMS_NUMBER'], to: contact_data, body: pickup_data
  end
end
