class PickupNotice
  def initialize
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
  end

  def send_notice(contact_data, donation_url)
    @client.account.messages.create from: ENV['TWILIO_SMS_NUMBER'], to: contact_data, body: message(donation_url)
  end

  def message(donation_url)
    "#WASTENOT has a pick-up!
    Are you available?
    #{donation_url}"
  end
end
