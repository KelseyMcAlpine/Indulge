class CategoriesController < ApplicationController
  before_action :require_login, only: [:new, :create]


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
      flash[:success] = "New category successfully added"
      redirect_to categories_path
    else
      raise
      flash.now[:error] = "Hmm.. something went wrong."
      render "new"
    end
  end


  private

  def category_params
    params.require(:category).permit(:name, :image_url)
  end

end
