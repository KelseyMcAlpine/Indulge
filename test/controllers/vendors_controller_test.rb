require "test_helper"

describe VendorsController do

  describe "user not logged in" do
    let(:vendor) {vendors(:polar_queen)}


    it "should get index" do
      get vendors_path
      must_respond_with :success
    end

  end

  describe "user logged id" do
    before do
      login_user(vendors(:polar_queen))
    end



    it "should get product management page" do
      get vendor_path(session[:vendor_id])
      must_respond_with :success
    end


  end

end
