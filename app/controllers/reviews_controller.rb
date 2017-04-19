class ReviewsController < ApplicationController
  def index; end

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new

    # if session[:user_id] == @product.user.id
    # flash to ensure vendors cannot review own products
    # redirect to specific product page
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)

    if @review.save
      #redirect_to specific product page
    else
      # render :new 
    end
  end


  private


  def reviews_params
    params.require(:review).permit(:product_id, :rating, :comment)
  end
end
