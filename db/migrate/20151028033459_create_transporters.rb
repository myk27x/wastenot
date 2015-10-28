class CreateTransporters < ActiveRecord::Migration
  def change
    create_table :transporters do |t|
      t.integer :user_id
      t.string :name
      t.integer :cell_phone
      t.time :open
      t.time :close

      t.timestamps null: false
    end
  end
end
