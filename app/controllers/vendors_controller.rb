class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all
  end

  def show
    @vendor = Vendor.find_by_id params[:vendor_id]

  end

  def account
    @vendor = Vendor.find_by_id params[:id]

  end

  private

  def vendor_params
    params.require(:vendor).permit(:username, :email)
  end




end
