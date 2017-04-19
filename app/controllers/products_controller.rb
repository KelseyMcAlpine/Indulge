class ProductsController < ApplicationController
  before_action :find_product, only: [:show]


  def index
    @products = Product.all
  end

  def show
    if !@product
      render_404
    end
  end


end

private

def find_product
  @product = Product.find_by_id params[:id]
end
