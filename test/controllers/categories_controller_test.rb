require "test_helper"

describe CategoriesController do
  let(:spa) {categories(:spa)}
  let(:vendor) { vendors(:polar_queen)}

  describe "User is not logged in" do

    it "should get index" do
      get categories_path
      must_respond_with :success
    end

    it "should not get form to create a new category" do
      get new_category_path
      must_respond_with :redirect
      must_redirect_to root_path
      flash[:warning].must_equal "You must be logged in as a vendor to view this page"
    end

  end

  describe "User/Vendor is logged in" do
    before do
      login_user(vendors(:Jim))
    end


    it "should get form to create a new category" do
      get new_category_path
      must_respond_with :success
    end

    it "should affect the model when a new category is added" do
      proc { post categories_path, params:
        { category: { name: "spicy" } }}.must_change 'Category.count', 1
    end

    it "should redirect to category index page after adding a new category" do
      post categories_path, params: { category: { name: "yummy"}}
      must_redirect_to categories_path
    end

  end
end
