require "test_helper"

describe ReviewsController do
let(:product) {products(:ice_floe)}
let(:review) {reviews(:first_review)}

  it "should get new review form" do
    get new_product_review_path(product.id)
    must_respond_with :success
  end


  it "should affect the model when creating a review" do

    proc {
      post product_reviews_path(product.id), params:  { review:
        { rating: 5,
          comment: "totally fantastic",
          product_id: product.id
        }
      }
    }.must_change 'Review.count', 1
  end

  it "should not save an invalid review to database" do
    proc {
      post product_reviews_path(product.id), params:  { review:
        { rating: 0,
          comment: "ghastly",
          product_id: product.id
        }
      }
    }.must_change 'Review.count', 0
  end

  it "vendor should not be able to review own product" do
    login_user(vendors(:polar_queen))
    proc {
      post product_reviews_path(product.id), params:  { review:
        { rating: 5,
          comment: "totally fantastic",
          product_id: product.id
        }
      }
    }.must_change 'Review.count', 0


  end

end
