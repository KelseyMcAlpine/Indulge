class OrdersController < ApplicationController
  before_action :current_order, only: [:add_product_order, :remove_product_order, :show, :checkout, :update]
  before_action :find_order_product, only: [:show, :change_cart_quantity]
  before_action :require_login, only: [:manage_orders, :order_details, :update]

  def index
    params[:vendor_id]
    vendor = Vendor.find_by(id: params[:vendor_id])
    @orders = vendor.orders
  end

  def show
    @op = @order.order_products.where(product_id: params[:product_id], order_id: @order.id).first
  end

  def add_product_order
    if @order.order_products.find_by_product_id(params[:product_id]) != nil
      if check_avail
        find_order_product
        @op.quantity += 1
        if @op.save
          remove_product_inventory(params[:product_id])
          flash[:success] = "Quantity increased"
          redirect_to :back
        else
          flash[:error] = "Unable to add to cart"
          redirect_to product_path(params[:product_id])
        end
      else
        flash[:error] = "Not enough inventory"
        redirect_to product_path(params[:product_id])
      end
    else
      create_order_product
    end
  end

  def remove_product_order
    op = @order.order_products.find_by_product_id(params[:product_id])
    if op.quantity > 1
      op.quantity -= 1
      if op.save
        add_product_inventory(params[:product_id])
        flash[:success] = "Quantity 1 removed from cart"
        redirect_to :back

      else
        flash[:error] = "Unable to remove from cart"
        render root_path

      end
    else
      op.destroy
      flash[:success] = "Product removed from cart"
      redirect_to :back

    end
  end

  def clear_cart
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

  def manage_orders
    @vendor = current_vendor
    @vendor_products = OrderProduct.where(product_id: @vendor.product_ids)
    return @vendor_products
  end

  def order_details
    @vendor = current_vendor
    @order = Order.find_by_id(params[:id])
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

    if @order.order_products.count < 1
      flash[:error] = "No items in cart"
      redirect_to root_path
    end
  end

  def update  # purchase
    @order.purchase_date = purchase_params[:purchase_date]
    @order.status = purchase_params[:status]
    @order.cust_email = purchase_params[:cust_email]
    @order.cust_address = purchase_params[:cust_address]
    @order.credit_card = purchase_params[:credit_card]
    @order.cc_expire = purchase_params[:cc_expire]

    if @order.save
      session[:order_id] = nil
      flash[:success] = "Order Placed!"
      redirect_to root_path
      # change to confirmation page eventually
    else
      flash.now[:error] = "Something went wrong"
      render "checkout"
    end
  end

  def change_ship_status
    @op = OrderProduct.find(params[:id])
    if @op.ship_status != "Cancelled"

      if @op.ship_status == "Shipped"
        @op.ship_status = "Not Shipped"
      else
        @op.ship_status = "Completed"
      end
      if @op.save
        flash[:success] = "Ship status updated"
        redirect_to :back
      else
        flash[:error] = "Unable to update ship status"
        redirect_to :back
      end
    else
      flash[:error] = "You can't update a cancelled order"
      redirect_to :back
    end
  end

  def cancel_order_product
    @op = OrderProduct.find(params[:id])
    if @op.ship_status != "Completed"
      @op.ship_status = "Cancelled"
      if @op.save
        flash[:success] = "Order line cancelled"
        redirect_to :back
      else
        flash[:error] = "Unable to cancel order line"
        redirect_to :back
      end
    else
      flash[:error] = "You can't cancel a completed order"
      redirect_to :back
    end
  end


  private

  def purchase_params
    params.require(:order).permit(:purchase_date, :status, :cust_email, :cust_address, :credit_card, :cc_expire)
  end

  def check_avail
    p = Product.find_by_id(params[:product_id])
    return true if p.inventory > 0
    return false
  end

  def order_params
    params.require(:order).permit(:purchase_date, :status, :cust_email, :cust_address, :credit_card, :cc_expire)
  end

  def current_order
    @order = Order.find_by_id(session[:order_id])
  end

  def find_order_product
    @op = @order.order_products.where(product_id: params[:product_id], order_id: @order.id).first
  end

  def create_order_product
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
      flash[:error] = "Unable to add item to cart"
    end
    redirect_to root_path
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


end
