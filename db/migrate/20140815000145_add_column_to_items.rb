class AddColumnToItems < ActiveRecord::Migration
  def change
    add_column :items, :inventory, :integer
  end
end
