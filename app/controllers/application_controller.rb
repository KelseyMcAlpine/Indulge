class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :find_order

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
