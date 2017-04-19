class Vendor < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates :email, presence: true, uniqueness: true
end
