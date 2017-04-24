class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create category_params

    if @category.id != nil
      flash[:success] = "New category successfully added"
      redirect_to categories_path
    else
      flash.now[:error] = "Hmm.. something went wrong."
      render "new"
    end
  end

  def product_list
    @category = Category.find_by_id(params[:category_id])

    if params[:category_id]
      @products = Product.includes(:categories).where(categories: { id: params[:category_id]} )
      # if @products == []
      #   flash[:error] = "There are no products in that category."
      # end
    end
  end


  private

  def category_params
    params.require(:category).permit(:name)
  end

end
