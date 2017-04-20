class ProductsController < ApplicationController

  before_action :find_product, only: [:show, :edit, :update]

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

  def destroy
  end 

  private

  def product_params
    params.require(:product).permit(:vendor_id, :price, :inventory, :name, :description, :photo_url, :lifecycle)
  end



  def find_product
    @product = Product.find_by_id params[:id]
  end
end
