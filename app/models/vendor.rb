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
end
