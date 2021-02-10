class Disc < ApplicationRecord
  belongs_to :manufacturer

  def self.in_production
    where("in_production = true")
  end
end
