require "test_helper"

describe ReviewsController do

  it "should get new" do
  product = products(:ice_floe)
  review = reviews(:first_review)
  proc {
    get new_product_review_path, params:  { review:
      {id: product.id,
      }
    }
  }
    must_respond_with :success
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
