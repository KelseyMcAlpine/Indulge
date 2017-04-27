class VendorsController < ApplicationController
  before_action :require_login, except: [:index, :new, :create]

  def index
    @vendors = Vendor.all
  end

  def show
    @vendor = current_vendor
  end

  def account
    @vendor = current_vendor
  end

  def new
    @vendor = Vendor.new
    @vendor.uid = session[:uid]
    @vendor.provider = session[:provider]
    @vendor.username = session[:username]
    @vendor.email = session[:email]
  end
  #
  def create
    @vendor = Vendor.create vendor_params

    if @vendor.id != nil
      flash[:success] = "New vendor account successfully created!"
      session[:vendor_id] = @vendor.id
      redirect_to vendor_account_path
    end
  end


  private

  def vendor_params
    params.require(:vendor).permit(:username, :email, :uid, :provider)
  end




end
