class VendorsController < ApplicationController
  before_action :require_login, except: [:index]

  def index
    @vendors = Vendor.all
  end

  def show
      @vendor = current_vendor
      # @vendor = Vendor.find_by_id params[:vendor_id]

      # @vendor = Vendor.find_by_id session[:vendor_id]
    end

  def account
    @vendor = Vendor.find_by_id params[:id]

  end

  # will revisit these controller actions
  # def new (auth_hash)
  #   @vendor = Vendor.new
  #   @vendor.uid = auth_hash["uid"]
  #   @vendor.provider = auth_hash["provider"]
  #   @vendor.username = auth_hash[:info][:name]
  #   @vendor.email = auth_hash[:info][:email]
  #
  # end
  #
  # def create
  #   @vendor = Vendor.create vendor_params
  #
  #   if @vendor.id != nil
  #     flash[:success] = "vendor added"
  #   end
  # end
  #
  # def edit
  # end
  #
  # def update
  # end

  private

  def vendor_params
    params.require(:vendor).permit(:username, :email, :uid, :provider)
  end




end
