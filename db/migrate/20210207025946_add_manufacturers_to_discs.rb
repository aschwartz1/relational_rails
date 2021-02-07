class AddManufacturersToDiscs < ActiveRecord::Migration[5.2]
  def change
    add_reference :discs, :manufacturer, foreign_key: true
  end
end
