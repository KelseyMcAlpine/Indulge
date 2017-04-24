class CategoriesController < ApplicationController

  def index
    @categories = Category.all
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
end
