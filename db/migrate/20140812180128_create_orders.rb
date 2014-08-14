class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :order_total
      t.string :order_type
      t.string :delivery_address
      t.string :order_status

      t.timestamps
    end
  end
end
