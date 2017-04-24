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

  def new (auth_hash)
    @vendor = Vendor.new
    vendor.uid = auth_hash["uid"]
    vendor.provider = auth_hash["provider"]
    vendor.username = auth_hash[:info][:name]
    vendor.email = auth_hash[:info][:email]
    
  end

  private

  def vendor_params
    params.require(:vendor).permit(:username, :email)
  end




end
