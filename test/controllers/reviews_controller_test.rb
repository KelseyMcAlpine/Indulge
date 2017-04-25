require "test_helper"

describe ReviewsController do
  it "should get index" do skip
    get reviews_index_path
    value(response).must_be :success?
  end

  it "should get new" do skip
    get new_product_review_path(product)
    value(response).must_be :success?
  end

  it "should get create" do skip
    get reviews_create_path
    value(response).must_be :success?
  end
end
