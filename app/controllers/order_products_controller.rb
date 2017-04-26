class OrderProductsController < ApplicationController
  def update
    @order_product = OrderProducts.find_by_product_id_and_order_id(params[:product_id], @order.id)
    @order_product.quantity = params[:quantity]
  end

  def change_ship_status
    @order_product = OrderProducts.find_by_product_id_and_order_id(params[:product_id], @order.id)
    if @order_product.ship_status == "Shipped"
      @order_product.ship_status = "Not Shipped"
    else
      @order_product.ship_status = "Shipped"
    end
  end
end
