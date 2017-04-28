class VendorsController < ApplicationController
  before_action :require_login, except: [:index]

  def index
    @vendors = Vendor.all
  end

  def show

    @vendor = current_vendor
  end

  def account
    @vendor = current_vendor
  end

  


  private

  def vendor_params
    params.require(:vendor).permit(:username, :email, :uid, :provider)
  end




end
