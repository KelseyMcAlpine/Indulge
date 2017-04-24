require "test_helper"

describe Category do
  let(:new_category) { Category.new }
  let(:product) { products(:ice_floe) }
  let(:category) { categories(:exotic) }

  it "must be valid" do
    new_category.name = "happiness-inducing"
    new_category.save
    value(new_category).must_be :valid?
  end

  # it "can be assigned to a product" do
  #
  # end
end
