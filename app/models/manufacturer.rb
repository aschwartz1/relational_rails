class Manufacturer < ApplicationRecord
  has_many :discs, dependent: :destroy

  validates_presence_of :name

  def discs_ordered_by_creation
    discs.order(:created_at)
  end
end
