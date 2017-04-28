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

    it "can create a new vendor" do
      fred = Vendor.new(username: "Fred", uid: "888", provider: "github", email: "fred@thefred.com")

      proc {
        login_user(fred)
        must_redirect_to vendor_account_path
        session[:vendor_id].must_equal Vendor.find_by(uid: "888").id
      }.must_change 'Vendor.count', 1
    end

    it "cannot log in without uid and provider in auth_hash" do
      OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({})

      proc {
        get auth_github_callback_path
        must_redirect_to root_path
        session[:vendor_id].must_be_nil
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
