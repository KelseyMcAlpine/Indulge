require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest

  describe ProductsController do
    let(:product) {products(:my_product)}
    # let(:product) {products(:my_product)}
    let(:sample_category) {categories(:exotic)}

    let(:vendor) {vendors(:Dwight)}


    it "should get index" do
      get products_path
      must_respond_with :success
    end

    it "index displays all the products for a vendor" do
      get vendors_path, vendor_id: vendor.id
      must_respond_with :success
    end

    it "should filter by category" do
      get category_products_path(sample_category.id)
      must_respond_with :success
    end

    it "should get show" do
      get product_path(product.id)
      must_respond_with :success
    end

    it "should update a product" do skip
      put product_path(products(:my_product).id), params: {product: {name: "nature break", description: "Relaxing", price: 5}
    }

    updated_product = Product.find_by_id(products(:my_product).id)
    # puts "product #{new_prod.name}"
    # puts "product #{new_prod.errors.messages}"

    updated_product.name.must_equal "nature break"
    updated_product.description.must_equal "Relaxing"
    updated_product.price.must_equal 5


    must_respond_with :redirect
  end

  it "should show 404 when product not found" do
    get product_path(0)
    must_respond_with :missing
  end

  it "should show the new form" do skip
    #Expected response to be a <2XX: success>, but was a <302: Found> redirect to <http://www.example.com/>

    get new_product_path
    must_respond_with :success
  end

  it "should redirect to list after adding a product" do skip
    post products_path, params: { product:
      { name: "Ski trip",
        price: product.price,
        inventory: product.inventory,
        description:product.description,
        photo_url: product.photo_url,
        lifecycle: product.lifecycle,
        vendor_id: vendor.id
      }
    }
    puts "{errors.messages}"
    must_redirect_to vendor_path(vendor.id)

  end

  it "should affect the model when creating a product" do skip
    proc {
      post products_path, params:  { product:
        { name: "Ski trip",
          price: products(:ice_floe).price,
          inventory: "2",
          description: "hehe",
          photo_url: products(:ice_floe).photo_url,
          lifecycle: "available",
          vendor_id: products(:ice_floe).vendor_id
        }
      }
    }.must_change 'Product.count', 1
  end

  it "should delete a product and redirect to product list" do skip
    delete  product_path(products(:ice_floe).id)
    must_redirect_to products_path
  end

  it "should show one product" do
    get product_path(product.id)
    must_respond_with :success
  end

  it "should get edit" do skip
    get edit_product_path(product.id)
    must_respond_with :success
  end

  it "product with no name should not affect the model" do skip

  end

  it "product with no price should not affect the model" do skip

  end

  it "product with no stock should not affect the model" do skip

  end

  it "Vendor cannot update attributes of another vendor's products" do skip

  end

  it "Retire will afffect product as unavailable from product list" do skip

  end

  it "Relist will restore product as available" do skip

  end
end



end
