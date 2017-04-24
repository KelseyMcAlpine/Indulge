class CartsController < ApplicationController
  def index
    # sessions
  end

  def new
  end

  def add
    check_product_availability
  end

  def remove
  end
end
