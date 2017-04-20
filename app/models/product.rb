class Product < ApplicationRecord
  has_many :reviews
  belongs_to :vendor
  has_and_belongs_to_many :categories
  has_many :order_products
  has_many :orders, through: :order_products

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0 }

end
