require "test_helper"

describe SessionsController do

  describe "auth_callback" do
    it "logs in an existing vendor and redirects to vendor account" do
      proc {
        login_user(vendors(:Michael))
        must_redirect_to vendor_account_path
        session[:vendor_id].must_equal vendors(:Michael).id
      }.must_change 'Vendor.count', 0
    end
  end












end
