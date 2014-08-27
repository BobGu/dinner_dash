class ChangeColumnNameOrderTotal < ActiveRecord::Migration
  def change
    change_column :orders, :order_total, :decimal, {precision: 4, scale: 2}
  end
end
