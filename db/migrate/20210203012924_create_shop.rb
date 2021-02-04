class CreateShop < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.boolean :liquor_license
      t.integer :revenue
      t.timestamps
    end
  end
end
