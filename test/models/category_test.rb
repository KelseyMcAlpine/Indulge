require "test_helper"

describe Category do

  let(:category) { Category.new(name: "sweet") }
  let(:category2) { Category.new }
  let(:new_category) { Category.new }
  let(:sample_product) { products(:twinkies) }


  it "must be valid" do
    new_category.name = "happiness-inducing"
    new_category.save
    value(new_category).must_be :valid?
  end


  it "should require a name to create a new category" do
    category2.valid?.must_equal false
    category2.errors.messages.must_include :name
  end

  it "should require that the category name is unique" do
    category.save
    category2.name = category.name
    category2.save.must_equal false
    category2.errors.messages.must_include :name
  end


  it "can be assigned to a product" do
      category.products.must_equal []
      category.products << sample_product
      category.products.length.must_equal 1
      category.products.first.name.must_equal sample_product.name
  end

end
