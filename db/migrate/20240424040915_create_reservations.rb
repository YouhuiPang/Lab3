class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.bigint :user_id, null: false
      t.bigint :restaurant_id, null: false
      t.bigint :table_id, null: false
      t.datetime :reservation_time
      t.integer :party_size
      t.string :status

      t.timestamps
    end

    add_foreign_key :reservations, :users
    add_foreign_key :reservations, :restaurants
    add_foreign_key :reservations, :tables
  end
end
