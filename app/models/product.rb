class Product < ApplicationRecord

  belongs_to :vendor

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0 }
end
