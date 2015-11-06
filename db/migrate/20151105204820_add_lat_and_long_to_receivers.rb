class AddLatAndLongToReceivers < ActiveRecord::Migration
  def change
    add_column :receivers, :latitude, :float
    add_column :receivers, :longitude, :float
  end
end
