require "test_helper"

describe Product do
  let(:product) { Product.new }
  let(:existing_product) { products(:ice_floe) }
  let(:vendor) { vendors(:polar_queen)}
  let(:sample_category) { categories(:exotic)}

  it "must require a name" do
    product.valid?.must_equal false
    product.errors.messages.must_include :name
  end

  it "cannot create a product with a duplicate name" do
    product.name = existing_product.name
    product.save.must_equal false
    product.errors.messages.must_include :name
  end

  it "must require a price" do
    existing_product.price = nil
    existing_product.valid?.must_equal false
    existing_product.errors.messages.must_include :price
  end

  it "must have a numerical price" do
    product.price = "more than you can afford"
    product.save.must_equal false
    product.errors.messages.must_include :price
  end

  it "must have a price that is greater than zero" do
    product.price = -50
    product.save.must_equal false
    product.errors.messages.must_include :price
  end

  it "must be associated with a vendor" do
    product.save.must_equal false
    product.errors.messages.must_include :vendor
  end

  it "can create a product with correct required values" do
    product.vendor_id = vendor.id
    product.price = 888
    product.name = "Massage Conducted by Trained Hamsters"
    product.save.must_equal true
    product.errors.messages[:name].must_equal []
  end
  #
  # it "has a list of reviews" do
  #
  # end
  #
  # it "can be assigned to a category" do
  #   product.categories = [sample_category]
  #   product.categories.must_equal ["exotic"]
  # end
  it "has a category" do
      product.categories.must_equal ["exotic"]

  end


end
