class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.create order_params

    if @order.id != nil
      flash[:success] = "Item added to cart"
      redirect_to root_path
    else
      flash.now[:error] = "Hmm.. something went wrong."
      render "new"
    end
  end

  private

  def order_params
    params.require(:order).permit(products: [])
  end
end
