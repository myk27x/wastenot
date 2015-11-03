class AddHoursOfOperationToReceiver < ActiveRecord::Migration
  def change
    add_column :receivers, :open,  :integer
    add_column :receivers, :close, :integer
  end
end
