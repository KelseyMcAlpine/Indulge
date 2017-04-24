class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def show
    if !@product
      render_404
    end
  end

  def create
    @category = Category.create category_params

    if @category.id != nil
      flash[:success] = "New category successfull added"
      redirect_to root_path
      # this should redirect to category index page once created
    else
      flash.now[:error] = "Hmm.. something went wrong."
      render "new"
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
