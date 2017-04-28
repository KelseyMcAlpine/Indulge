require "test_helper"

describe ReviewsController do

  it "should get new" do
  product = products(:ice_floe)

  proc {
    get new_product_review_path, params:  { review:
      {id: product.id,
      }
    }
  }
    must_respond_with :success
  end

  it "should get create" do 
    proc {
      get product_reviews_path, params:  { review:
        {id: product.id,
        }
      }
    }
      must_respond_with :success
  end


end
