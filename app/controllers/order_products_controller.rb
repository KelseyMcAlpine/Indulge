class OrderProductsController < ApplicationController
  def update
    @order_product = OrderProducts.find_by_product_id_and_order_id(params[:product_id], @order.id)
    @order_product.quantity = params[:quantity]
  end


end
