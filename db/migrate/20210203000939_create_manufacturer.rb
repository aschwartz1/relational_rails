class CreateManufacturer < ActiveRecord::Migration[5.2]
  def change
    create_table :manufacturers do |t|
      t.string :name
      t.integer :founded_in
      t.boolean :in_business

      t.timestamps
    end
  end
end
