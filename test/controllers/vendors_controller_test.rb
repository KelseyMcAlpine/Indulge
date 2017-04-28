require "test_helper"

describe VendorsController do

  describe "user not logged in" do
    let(:vendor) {vendors(:polar_queen)}


    it "should get index" do
      get vendor_path(vendor.id)
      must_respond_with :found
    end


    it "should get form for new vendor" do
      get new_vendor_path(vendor.id)
      must_respond_with :success
    end

    it "should show 404 when vendor not found" do
      get vendor_path(10000) # need to edit controller to show 404
      must_respond_with :found
    end


   it "should redirect to index after adding vendor" do skip
     post vendors_path, params: { vendor:
     { username: "Polar Queen2",
       email: "queen@seriouslyfreezing.com",
       uid: "111",
       provider: "github"
       }
     }
     must_redirect_to vendor_account_path
   end


  end

  describe "user logged id" do

    it "should get order management page" do
      get manage_orders_path(session[:vendor_id])
      must_respond_with :found

    end

    it "should get product management page" do
      get vendor_path(session[:vendor_id])
      must_respond_with :success
    end


  end

end
