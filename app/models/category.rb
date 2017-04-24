class Category < ApplicationRecord
  has_and_belongs_to_many :products
  # has_many :categories_products
  # has_many :products, through: :categories_products

  validates_presence_of :name
end
