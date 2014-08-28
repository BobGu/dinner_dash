class AddRetireToItems < ActiveRecord::Migration
  def change
    add_column :items, :retire, :boolean
    reversible do |dir|
      dir.up { Item.update_all retire: false }
    end
  end
end
