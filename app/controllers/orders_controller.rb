class OrdersController < ApplicationController
  def index
    params[:vendor_id]
    vendor = Vendor.find_by(id: params[:vendor_id])
    @orders = vendor.orders
  end
end
