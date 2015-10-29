class RemoveCellCarrierFromTransporter < ActiveRecord::Migration
  def change
    remove_column :transporters, :cell_carrier, :string
  end
end
