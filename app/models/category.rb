class Category < ApplicationRecord

  #validates :category, uniqueness: true, presence: true, format: {with: /\A[ a-zA-Z]+\z/, message: "only allows letters" }
end
