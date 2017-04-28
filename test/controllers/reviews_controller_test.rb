require "test_helper"

describe ReviewsController do
let(:product) {products(:ice_floe)}
let(:review) {reviews(:first_review)}
  it "should get new" do

  proc {
    get new_product_review_path, params:  { review:
      {product_id: product.id,
      }
    }
  }
    must_respond_with :success
  end

  it "should get create" do
    proc {
      get product_reviews_path, params:  { review:
        {product_id: product.id,
        }
      }
    }
      must_respond_with :success
  end

  it "should save a review to the database" do
     product = products(:ice_floe)
    proc {
      get product_reviews_path, params:  { review:
        { rating: review.rating,
          comment: review.comment,
          product_id: product.id
        }
      }
    }.must_change 'Review.count', 1
  end

  it "should not save an invalid review to database" do
    proc {
      get product_reviews_path, params:  { review:
        { rating: 0,
          comment: review.comment,
          product_id: product.id
        }
      }
    }.must_change 'Review.count', 0
  end

  it "vendor should not be able to review own product" do
    
  end

end
