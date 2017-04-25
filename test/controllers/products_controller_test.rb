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

    it "should update a product" do
      put product_path(products(:my_product).id), params: {product: {name: "nature break", description: "Relaxing"} }

      updated_product = Product(products(:my_product).id)

      updated_product.name.must_equal
     "nature break"
     updated_product.description.must_equal "Relaxing"

      must_respond_with :redirect
    end

    it "should show 404 when product not found" do
      get product_path(0)
      must_respond_with :missing
    end

    it "should show the new form" do
      get new_product_path
      must_respond_with :success
    end

    it "should redirect to list after adding a product" do
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
      must_redirect_to products_path
    end

    it "should affect the model when creating a product" do
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

    it "should delete a product and redirect to product list" do
      delete  product_path(products(:ice_floe).id)
      must_redirect_to products_path
    end

    it "should show one product" do
      get product_path(product.id)
      must_respond_with :success
    end

    it "should get edit" do
      get edit_product_path(product.id)
      must_respond_with :success
    end
  end



end
