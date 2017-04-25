class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
   before_action :require_login
  helper_method :current_vendor

  def require_login
    if !session[:vendor_id]
      flash[:warning] = "You must be logged in as a vendor to view this page"
      redirect_to vendors_path
      # redirect_back(fallback_location: root_path)
    end
  end

  def current_vendor
    @logged_in_vendor ||= Vendor.find(session[:vendor_id]) if session[:vendor_id]
  end

  def render_404
    render file: "#{ Rails.root }/public/404.html", status: 404
  end


end
