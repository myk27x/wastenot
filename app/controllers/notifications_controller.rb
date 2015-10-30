class NotificationsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def notify
    message = PickupNoticeSender.notify(current_user.transporter.cell_phone, ) #TODO add pickup data from/for self
    render plain: message.status
  end

end
