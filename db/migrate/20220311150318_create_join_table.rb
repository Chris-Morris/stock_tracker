class CreateJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :stock_lists do |t|
      t.index [:user_id, :stock_list_id], name: 'user_stock_id', unique: true
    end
  end
end
