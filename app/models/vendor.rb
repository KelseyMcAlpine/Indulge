class Vendor < ApplicationRecord
  has_many :products

  # validates :username, uniqueness: true, presence: true
  # validates :email, presence: true, uniqueness: true

  def self.create_from_github(auth_hash)
    vendor = Vendor.new
    vendor.uid = auth_hash["uid"]
    vendor.provider = auth_hash["provider"]
    vendor.username = auth_hash["info"]["name"]
    vendor.email = auth_hash["info"]["email"]

    vendor.save ? vendor : nil
  end


  def total_rev
    #op is vendor's order product objects
    @ops = OrderProduct.where(product_id: product_ids)
    rev = []
    @ops.each do |op|
      if op.order.status == "paid" || op.order.status == "completed"
        rev << op.product.price * op.quantity
      end
    end
    return rev.reduce(:+)
  end
end
