class OrdersController < ApplicationController
  def index
    params[:vendor_id]
    vendor = Vendor.find_by(id: params[:vendor_id])
    @orders = vendor.orders


    
  end

  def new
    @order = Order.new
  end

  def add
    #check availability first
    order = Order.find_by_id params:[:id]
  end

  def remove
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

  private

  def order_params
    params.require(:order).permit(:purchase_date, :status, :cust_email, :cust_address, :credit_card, :cc_expire)
  end
end
