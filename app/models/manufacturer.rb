class Manufacturer < ApplicationRecord
  has_many :discs, dependent: :destroy

  validates_presence_of :name

  def self.order_by_creation
    order(:created_at)
  end

  def disc_count
    discs.length
  end

  def discs_alpha_sort
    discs.order(:name)
  end

  def discs_above_weight(max_weight)
    discs.where("max_weight > #{max_weight}")
  end

  def discs_above_weight_alpha_sort(max_weight)
    discs.where("max_weight > #{max_weight}").order(:name)
  end
end
