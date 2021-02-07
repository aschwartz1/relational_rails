class Manufacturer < ApplicationRecord
  has_many :discs

  validates_presence_of :name
end
