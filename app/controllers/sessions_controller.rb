class SessionsController < ApplicationController
  before_action :require_login, only: [:logout], raise: false

  def create
    auth_hash = request.env['omniauth.auth']

    vendor = Vendor.find_by(uid: auth_hash["uid"], provider: auth_hash["provider"])

    if vendor.nil?
      vendor = Vendor.create_from_github(auth_hash)

      if vendor.nil?
        flash[:error] = "Could not log in."
        redirect_to root_path
      else
        session[:vendor_id] = vendor.id
        flash[:success] = "Created new vendor account for #{vendor.username}"
        redirect_to vendor_account_path
      end
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
