class Order < ApplicationRecord
  has_many :order_products
  has_many :products, through: :order_products

  # validates :cust_email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  # #also that it is a valid email
  # validates :cust_address, presence: true
  # # can maybe build in validating zip
  # #also that it is a valid address
  # validates :credit_card, presence: true
  # validates :cc_expire, presence: true
  # validate :expired? #this should be at the checkout validation

  def subtotal
    order_products.collect { | product | product.valid? ? (product.quantity * product.price) : 0 }.sum
  end

  # def change_order_status
  # end

  def expired?
    if cc_expire <= Date.today
      return true
    else
      return false
    end
  end
end
