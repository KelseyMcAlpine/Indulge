class OrdersController < ApplicationController
  before_action :find_order, only: [:add_product_order, :remove_product_order, :show]

  def index
    params[:vendor_id]
    vendor = Vendor.find_by(id: params[:vendor_id])
    @orders = vendor.orders
  end

  def show
    find_order
  end

  def add_product_order
    if check_avail
      o = OrderProduct.create
      o.product_id = params[:product_id]
      o.order_id = @order.id
      o.quantity = 1
      o.save
      @order.order_products << o
      if @order.save
        remove_product_inventory(params[:product_id])
        flash[:success] = "Item added to cart"
      else
        flash.now[:error] = "Product not available"
      end
      redirect_to root_path
    end
  end

  # def increase_quantity
  # end

  def remove_product_order
    @order.order_products.first.delete(params[:id])
    add_product_inventory(params[:id])
  end

  def clear_cart
  end

  def add_product_inventory(id)
    p = Product.find_by_id(id)
    p.inventory += 1
    p.save
  end

  def remove_product_inventory(id)
    p = Product.find_by_id(id)
    p.inventory -= 1
    p.save
  end

  def create
    @order = Order.create order_params
    unless @order.id == nil
      flash[:sucess] = "Your order has been succesfully submitted"
      redirect_to root_path
    else
      flash.now[:error] = "Error occured, try again".
      render "new"
    end
  end

  def checkout
  end

  private

  def check_avail
    p = Product.find_by_id(params[:product_id])
    return true if p.inventory > 1
    return false
  end

  def order_params
    params.require(:order).permit(:purchase_date, :status, :cust_email, :cust_address, :credit_card, :cc_expire)
  end

  def find_order
    # if session[:order_id]
    @order = Order.find(9)
    # else
    #   @order = Order.new
    # end
  end
end
