class AddDefaultValueToRoleAttribute < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.change :role, :string, :default => 'customer'
    end
  end
end
