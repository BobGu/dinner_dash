class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :display_name
      t.string :role
      t.string :email

      t.timestamps
    end
  end
end
