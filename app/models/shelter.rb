class Shelter < ApplicationRecord
  validates :index,   presence: true, uniqueness: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 256 }
  validates :name,    presence: true
  validates :address, presence: true
  validates :phone,   presence: true
end
