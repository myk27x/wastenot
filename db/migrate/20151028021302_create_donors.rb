class CreateDonors < ActiveRecord::Migration
  def change
    create_table :donors do |t|
      t.integer  :user_id
      t.string   :org_name
      t.string   :street_address
      t.string   :contact_name
      t.string   :phone

      t.timestamps null: false
    end
  end
end
