class DropUsers < ActiveRecord::Migration[6.1]
  def up
    drop_table :users
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
