class ProductsController < ApplicationController

  before_action :find_product, only: [:show, :edit, :update, :update_availability]

  def new
    @product = Product.new
    @categories = Category.all
  end

  def create
    @product = Product.create(product_params)


    if @product.id != nil
      if @product.save
        flash[:success] = "New product successfully added"
        redirect_to product_path(@product.id)
      else
        flash.now[:error] = "Hmm.. something went wrong."
        render "root_"
      end
    # resolving merge conflict but not sure which is correct version
    #   flash[:success] = "New product successfully added"
    #   redirect_to product_path(@product.id)
    # else
    #   flash.now[:error] = "Hmm.. something went wrong."
    #   render "new"
    end
  end

  def index
    if params[:category_id]
      category = Category.find_by(id: params[:category_id])
      @products = category.products
      # @products = Product.includes(:categories).where(categories: { id: params{:category_id}} )
    elsif params[:vendor_id]
      vendor = Vendor.find_by(id: params[:vendor_id])
      @products = vendor.products
    else
      @products = Product.all
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
    @product.photo_url = product_params [:photo_url]

    if @product.save
      flash[:success] = "Successfully updated #{@product.name}."
      redirect_to product_path(@product.id) #this is the show page
    else
      render "edit"
    end
  end

  def destroy
    Product.destroy(params[:id])
    redirect_to products_path
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
    params.require(:product).permit(:vendor_id, :price, :inventory, :name, :description, :photo_url, category_ids: [])
  end

  def find_product
    @product = Product.find_by_id params[:id]
    # should return 404 if not found
  end
end
