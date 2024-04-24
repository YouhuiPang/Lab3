class CreateRestaurants < ActiveRecord::Migration[7.1]
  def change
    create_table :restaurants do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.string :food_type
      t.string :open_hour
      t.string :price_range

      t.timestamps
    end
  end
end
