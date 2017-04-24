class Order < ApplicationRecord
  has_many :order_products
  has_many :products, through: :order_products

  validates :cust_email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  #also that it is a valid email
  validates :cust_address, presence: true
  # can maybe build in validating zip
  #also that it is a valid address
  validates :credit_card, presence: true
  validates :cc_expire, presence: true

  private

  def cc_expired? cc_expire
    if cc_expire < Date.today
      return true
    else
      false
    end
  end


end
