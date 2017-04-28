require "test_helper"

describe HomeController do
  it "should get index" do
    get root_path
    must_respond_with :success
  end
end
