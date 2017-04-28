class ProductsController < ApplicationController

  before_action :find_product, only: [:show, :edit, :update, :update_availability]
  before_action :require_login, except: [:index, :show, :find_product]

  def new
    @product = Product.new
    @categories = Category.all
  end

  def create
    @product = Product.new(product_params)
    @product.vendor_id = session[:vendor_id]

    if @product.save
      flash[:success] = "New product successfully added"
      redirect_to vendor_path
    else
      flash.now[:error] = "Hmm.. something went wrong."
      render "new"
    end

  end

  def index
    if params[:category_id]
      category = Category.find_by(id: params[:category_id])
      @products = category.products
      @description = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam omnis, maxime libero natus qui minus!"
      @header = "Products in #{category.name}"
      @image = category.image_url
      # @products = Product.includes(:categories).where(categories: { id: params{:category_id}} )
    elsif params[:vendor_id]
      vendor = Vendor.find_by(id: params[:vendor_id])
      @products = vendor.products
      @description = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam omnis, maxime libero natus qui minus!"
      @header = "Products from #{vendor.username}"
      @image = vendor.image_url

    else
      @products = Product.all
      @header = "All products"
      @description = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam omnis, maxime libero natus qui minus!"
      @image = "https://unsplash.it/1500/500/?random"
    end
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
    @product.photo_url = product_params[:photo_url]
    @product.category_ids = product_params[:category_ids]


    if @product.save
      flash[:success] = "Successfully updated #{@product.name}."
      redirect_to product_path(@product.id) #this is the show page
    else
      render "edit"
    end
  end

  def destroy
    Product.destroy(params[:id])
    redirect_to vendor_path
  end

  def update_availability
    if @product.lifecycle == "available"
      @product.lifecycle = "unavailable"
      if @product.save
        flash[:success] = "Successfully updated #{@product.name}."
        redirect_to vendor_path(@product.vendor.id)
      else
        flash[:error] = "Did not successfully update #{@product.name}."
        render "show"
      end
    else
      @product.lifecycle = "available"
      if @product.save
        flash[:success] = "Successfully updated #{@product.name}."
        redirect_to vendor_path(@product.vendor.id)
      else
        flash[:error] = "Did not successfully update #{@product.name}."
        render "show"
      end
    end
  end

  private

  def product_params
    params.require(:product).permit(:vendor_id, :price, :inventory, :name, :description, :lifecycle, :photo_url, category_ids: [])
  end

  def find_product
    @product = Product.find_by_id params[:id]
    # should return 404 if not found
  end
end
