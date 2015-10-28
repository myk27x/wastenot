class AddHoursOfOperationToReceiver < ActiveRecord::Migration
  def change
    add_column :receivers, :open,  :time
    add_column :receivers, :close, :time
  end
end
