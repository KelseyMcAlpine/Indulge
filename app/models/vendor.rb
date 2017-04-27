class Vendor < ApplicationRecord
  has_many :products

  validates :username, uniqueness: true, presence: true
  validates :email, presence: true, uniqueness: true



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
