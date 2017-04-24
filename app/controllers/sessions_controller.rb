class SessionsController < ApplicationController

  def create
    auth_hash = request.env['omniauth.auth']

    vendor = Vendor.find_by(uid: auth_hash["uid"], provider: auth_hash["provider"])


    if vendor.nil?
      vendor = Vendor.create_from_github(auth_hash)

      if vendor.nil?
        flash[:error] = "Could not log you in"
        redirect_back(fallback_location: root_path)
      end
    end
  end
end 
