class Vendor < ApplicationRecord
  has_many :products

  validates :username, uniqueness: true, presence: true
  validates :email, presence: true, uniqueness: true

  def self.create_from_github(auth_hash)
    vendor = Vendor.new

    if auth_hash["uid"] == nil || auth_hash["provider"] == nil || auth_hash["info"] == nil
      return nil
    end

    vendor.uid = auth_hash["uid"]
    vendor.provider = auth_hash["provider"]
    vendor.username = auth_hash["info"]["name"]
    vendor.email = auth_hash["info"]["email"]

    # if name not supplied by github, create unique username
    if vendor.username == nil || vendor.username == ""
      vendor.username = self.generate_username
    end

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

  def self.generate_username
    chars = ['A'..'Z', 'a'..'z', '0'..'9'].map{|r|r.to_a}.flatten
    return "vendor#{Array.new(6).map{chars[rand(chars.size)]}.join}"
  end

end
