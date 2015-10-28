class CreateDonors < ActiveRecord::Migration
  def change
    create_table :donors do |t|
      t.integer  :user_id
      t.string   :org_name
      t.string   :street_address
      t.string   :city
      t.string   :state
      t.integer  :zip
      t.string   :contact_name
      t.integer  :phone
      t.string   :user_email

      t.timestamps null: false
    end
  end
end
