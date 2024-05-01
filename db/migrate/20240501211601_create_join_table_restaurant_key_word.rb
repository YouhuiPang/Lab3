class CreateJoinTableRestaurantKeyWord < ActiveRecord::Migration[7.1]
  def change
    create_join_table :restaurants, :keywords do |t|
      # t.index [:restaurant_id, :keyword_id]
      # t.index [:keyword_id, :restaurant_id]
    end
  end
end
