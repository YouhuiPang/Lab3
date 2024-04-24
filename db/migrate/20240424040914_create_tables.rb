class CreateTables < ActiveRecord::Migration[7.1]
  def change
    create_table :tables do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.integer :capacity
      t.string :status

      t.timestamps
    end
  end
end
