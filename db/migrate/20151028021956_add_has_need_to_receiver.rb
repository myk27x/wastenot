class AddHasNeedToReceiver < ActiveRecord::Migration
  def change
    add_column :receivers, :has_need, :boolean
  end
end
