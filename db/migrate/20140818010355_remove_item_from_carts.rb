class RemoveItemFromCarts < ActiveRecord::Migration
  def change
    remove_column :carts, :item, :string
  end
end
