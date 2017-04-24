class VendorsController < ApplicationController

  before_action :find_vendor, only: [:show, :account]


  def index
    @vendors = Vendor.all
  end

  def show; end

  def account; end

  private

  def vendor_params
    params.require(:vendor).permit(:username, :email)
  end

  def find_vendor
    @vendor = Vendor.find_by_id params[:vendor_id]
  end



end
