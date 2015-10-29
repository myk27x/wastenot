class AddCarrierToTransporter < ActiveRecord::Migration
  def change
    add_column :transporters, :cell_carrier, :string
  end
end
