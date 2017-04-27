require "test_helper"

describe SessionsController do

  describe "auth_callback" do
    it "logs in an existing vendor and redirects to vendor account" do
      proc {
        login_user(users(:Michael))
        must_redirect_to vendor_account_path
        session[:vendor_id].must_equal users(:Michael).id
      }.must_change 'User.count', 0
    end
  end












end
