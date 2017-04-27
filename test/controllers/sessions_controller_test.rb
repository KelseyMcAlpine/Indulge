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

  describe "logging out" do
    it "can log out a logged in vendor" do
      login_user(vendors(:Michael))
      delete logout_path
      session[:vendor_id].must_be_nil
      must_redirect_to root_path
    end
  end












end
