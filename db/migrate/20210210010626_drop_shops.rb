class DropShops < ActiveRecord::Migration[5.2]
  def up
    drop_table :shops
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
