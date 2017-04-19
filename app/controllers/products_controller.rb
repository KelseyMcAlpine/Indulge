class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create
    @product = Product.create product_params

    if @product.id != nil
      flash[:success] = "New product successfull added"
      redirect_to product_path(@product.id)
    else
      flash.now[:error] = "Hmm.. something went wrong."
      render "new"
    end
  end

  private

  def product_params
    params.require(:product).permit(:vendor_id, :price, :inventory, :name, :description, :photo_url, :lifecycle)
  end
end
