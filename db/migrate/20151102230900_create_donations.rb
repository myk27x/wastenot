class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.integer  :donor_id
      t.string   :address
      t.string   :city
      t.string   :zip
      t.text     :instructions

      t.timestamps null: false
    end
  end
end
