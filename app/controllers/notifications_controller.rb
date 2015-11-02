class NotificationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def notify
    message = PickupNoticeSender.send_notice(current_user.sms_number)

    render plain: message.status
  end

end
