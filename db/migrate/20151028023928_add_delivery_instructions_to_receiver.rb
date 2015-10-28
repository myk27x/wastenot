class AddDeliveryInstructionsToReceiver < ActiveRecord::Migration
  def change
    add_column :receivers, :delivery_instructions, :text
  end
end
