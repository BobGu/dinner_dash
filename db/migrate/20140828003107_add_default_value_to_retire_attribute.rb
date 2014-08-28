class AddDefaultValueToRetireAttribute < ActiveRecord::Migration
  def change
    change_table :items do |t|
      t.change :retire, :boolean, :default => 'false'
    end
  end
end
