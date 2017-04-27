class SessionsController < ApplicationController
  before_action :require_login, only: [:logout], raise: false

  def create
    auth_hash = request.env['omniauth.auth']

    vendor = Vendor.find_by(uid: auth_hash["uid"], provider: auth_hash["provider"])

    #send to new vendor form with details from auth hash
    if vendor.nil?
      session[:uid] = auth_hash[:uid]
      session[:provider] = auth_hash[:provider]
      session[:username] = auth_hash["info"]["name"]
      session[:email] = auth_hash["info"]["email"]
      redirect_to new_vendor_path
    else
      session[:vendor_id] = vendor.id
     flash[:success] = "Logged in successfully!"
     redirect_to vendor_account_path
    end

  end

  def logout
    session[:vendor_id] = nil
    flash[:success] = "You are successfully logged out"
    redirect_to root_path
  end


end
