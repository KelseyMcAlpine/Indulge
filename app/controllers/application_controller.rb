class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :find_order
  before_action :require_login, only: [:current_vendor]
  helper_method :current_vendor

  def require_login
    if !session[:vendor_id]
      flash[:warning] = "You must be logged in as a vendor to view this page"
      redirect_to root_path
    end
  end

  def current_vendor
    @logged_in_vendor ||= Vendor.find(session[:vendor_id]) if session[:vendor_id]
  end

  def render_404
    render file: "#{ Rails.root }/public/404.html", status: 404
  end

  def find_order
    if session[:order_id] == nil
      o = Order.create
      session[:order_id] = o.id
    end
  end

end
