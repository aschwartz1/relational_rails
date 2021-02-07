class CreateDisc < ActiveRecord::Migration[5.2]
  def change
    create_table :discs do |t|
      t.string :name
      t.integer :max_weight
      t.boolean :in_production
      t.references :manufacturer, index: true, foreign_key: true

      t.timestamps
    end
  end
end
