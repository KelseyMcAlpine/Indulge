require "test_helper"

describe CategoriesController do

  it "should get index" do
    get categories_path
    must_respond_with :success
  end
  
end
