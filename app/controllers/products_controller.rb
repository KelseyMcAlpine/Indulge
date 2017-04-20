class ProductsController < ApplicationController

  before_action :find_product, only: [:show, :edit, :update, :update_availability]

  def new
    @product = Product.new
  end

  def create
    @product = Product.create product_params

    if @product.id != nil
      flash[:success] = "New product successfull added"
      redirect_to product_path(@product.id)
    else
      flash.now[:error] = "Hmm.. something went wrong."
      render "new"
    end
  end

  def index
    @products = Product.all
  end

  def show
    if !@product
      render_404
    end
  end

  def edit; end

  def update
    @product.price = product_params[:price]
    @product.inventory = product_params[:inventory]
    @product.name = product_params[:name]
    @product.description = product_params[:description]
    @product.photo_url = product_params [:photo_url]

    if @product.save
      flash[:success] = "Successfully updated #{@product.name}."
      redirect_to product_path(@product.id) #this is the show page
    else
      render "edit"
    end
  end

  def update_availability
    if @product.lifecycle == "available"
      @product.lifecycle = "unavailable"
      if @product.save
        flash[:success] = "Successfully updated #{@product.name}."
        redirect_to vendor_path(@product.vendor.id)
      else
        flash[:error] = "Did not successfully updated #{@product.name}."
        render "show"
      end
    else
      @product.lifecycle = "available"
      if @product.save
        flash[:success] = "Successfully updated #{@product.name}."
        redirect_to vendor_path(@product.vendor.id) 
      else
        flash[:error] = "Did not successfully updated #{@product.name}."
        render "show"
      end
    end
  end

  private

  def product_params
    params.require(:product).permit(:vendor_id, :price, :inventory, :name, :description, :photo_url, :lifecycle)
  end



  def find_product
    @product = Product.find_by_id params[:id]
  end
end
