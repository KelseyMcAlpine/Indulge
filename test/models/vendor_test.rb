require "test_helper"

describe Vendor do
  let(:jim) { vendors(:Jim) }
  let(:dwight) { vendors(:Dwight) }
  let(:michael) { vendors(:Michael) }

  describe "relations" do
    it "vendor must be associated with products" do
      jim.must_respond_to :products
      jim.products.each do | product |
        product.must_be_kind_of Product
      end
    end
  end

  describe "validations" do
    it "must be able to create a valid vendor" do
      michael.must_be :valid?
    end

    it "vendor cannot be created without a username" do
      jim.username = nil
      jim.valid?.must_equal false
      jim.errors.messages.must_include :username
    end

    it "vendor cannot be created without an email" do
      jim.email = nil
      jim.valid?.must_equal false
      jim.errors.messages.must_include :email
    end

    it "vendor requires a unique username" do
      jim.username = 'notunique'
      jim.save!

      dwight.username = 'notunique'
      dwight.save.must_equal false
      dwight.errors.messages.must_include :username
    end

    it "vendor requires a unique email" do 
      jim.email = 'notunique'
      jim.save!

      dwight.email = 'notunique'
      dwight.save.must_equal false
      dwight.errors.messages.must_include :email
    end
  end
end
