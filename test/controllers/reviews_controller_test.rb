require "test_helper"

describe ReviewsController do
  it "should get index" do skip
    get reviews_index_url
    value(response).must_be :success?
  end

  it "should get new" do skip
    get reviews_new_url
    value(response).must_be :success?
  end

  it "should get create" do skip 
    get reviews_create_url
    value(response).must_be :success?
  end

end
