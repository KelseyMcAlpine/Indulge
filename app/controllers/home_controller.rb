class HomeController < ApplicationController

  def index
    # @top_products = [Product.find(1), Product.find(2), Product.find(3), Product.find(4), Product.find(5), Product.find(6)]
    @top_products = Product.all.limit(6)
  end
end
