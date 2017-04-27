class Vendor < ApplicationRecord
  has_many :products

  validates :username, uniqueness: true, presence: true
  validates :email, presence: true, uniqueness: true


end
