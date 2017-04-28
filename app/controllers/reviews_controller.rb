class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @product = Product.find(params[:product_id])

    if session[:vendor_id] == @product.vendor_id
      flash[:error] = "You cannot review your own product"
      redirect_to product_path(@product.id)
    end
    @review = Review.new
  end

  def create
    
    @review = Review.new(reviews_params)
    @product = Product.find(params[:product_id])
    @review.product_id = @product.id

    if @review.save
      redirect_to product_path(@product.id)
    else
      flash[:error] = "Something went wrong"
      render :new

    end
  end

  private

  def reviews_params
    params.require(:review).permit(:product_id, :rating, :comment)
  end
end
