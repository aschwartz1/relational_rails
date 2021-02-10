class Disc < ApplicationRecord
  belongs_to :manufacturer

  def self.in_production_by_manufacturer(manufacturer_id)
    # where("manufacturer_id = #{manufacturer_id} AND in_production = true")
    where("manufacturer_id = :manufacturer_id AND in_production = true", {manufacturer_id: manufacturer_id})
  end
end
