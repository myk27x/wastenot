class CreateTransporters < ActiveRecord::Migration
  def change
    create_table :transporters do |t|
      t.integer  :user_id
      t.string   :name
      t.string   :cell_phone
      t.integer  :open
      t.integer  :close

      t.timestamps null: false
    end
  end
end
