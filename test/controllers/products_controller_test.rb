require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest

  describe ProductsController do
    let(:product) {products(:my_product)}
    let(:sample_category) {categories(:exotic)}

    let(:vendor) {vendors(:Dwight)}


    describe "User is not logged in" do


      it "index displays all the products for a vendor" do
        get vendors_path, vendor_id: vendor.id
        must_respond_with :success
      end

      it "should get index" do
        get products_path
        must_respond_with :success
      end

      it "should filter by category" do
        get category_products_path(sample_category.id)
        must_respond_with :success
      end

      it "should fail to update a product when vendor not logged in" do
        put product_path(products(:my_product).id), params: {product: {name: "nature break", description: "Relaxing", price: 5
        }
      }

      updated_product = Product.find_by_id(products(:my_product).id)

      updated_product.name.must_equal "squatty potty"
      updated_product.description.must_equal "helps you poop like a cave man"
      updated_product.price.must_equal 25

      must_respond_with :redirect
      must_redirect_to root_path
    end

    it "should show 404 when product not found" do
      get product_path(0)
      must_respond_with :missing
    end

    it "should not show the new form when vendor not logged in" do

      get new_product_path
      must_respond_with :redirect
      must_redirect_to root_path
    end

    it "should not be add a product when not logged in" do
      proc {
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
    }.must_change 'Product.count', 0

    must_respond_with :redirect
    must_redirect_to root_path

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

    it "should not be able to delete a product when not logged in" do
      delete  product_path(products(:ice_floe).id)
      must_respond_with :redirect
      must_redirect_to root_path
    end

    it "should show one product" do
      get product_path(product.id)
      must_respond_with :success
    end

    it "should get edit" do skip
      get edit_product_path(product.id)
      must_respond_with :success
    end

    it "product with no name should not affect the model" do
      proc {
        post products_path, params:  { product:
          {
            price: products(:ice_floe).price,
            inventory: "2",
            description: "hehe",
            photo_url: products(:ice_floe).photo_url,
            lifecycle: "available",
            vendor_id: products(:ice_floe).vendor_id
          }
        }
      }.must_change 'Product.count', 0

    end

    it "product with no price should not affect the model" do
      proc {
        post products_path, params:  { product:
          { name: "Ski trip",
            inventory: "2",
            description: "hehe",
            photo_url: products(:ice_floe).photo_url,
            lifecycle: "available",
            vendor_id: products(:ice_floe).vendor_id
          }
        }
      }.must_change 'Product.count', 0

    end

    it "product with no stock should not affect the model when updated" do
      proc {
        post products_path, params:  { product:
          { name: "Ski trip",
            inventory: products(:no_stock).inventory,
            description: products(:no_stock).description,
            photo_url: products(:no_stock).photo_url,
            lifecycle: products(:no_stock).lifecycle,
            vendor_id: products(:no_stock).vendor_id
          }
        }
      }.must_change 'Product.count', 0
      puts "#{products(:no_stock).lifecycle}"
      "#{products(:no_stock).errors.messages}"


    end

    it "Vendor cannot update attributes of another vendor's products" do skip


    end

    it "Retire will afffect product as unavailable from product list" do skip

    end

    it "Relist will restore product as available" do skip

    end
  end



  it "should get show" do
    get product_path(product.id)
    must_respond_with :success
  end

  it "should show 404 when product not found" do
    get product_path(0)
    must_respond_with :missing
  end

  it "should show one product" do skip
    get product_path(product.id)
    must_respond_with :success
  end

end


describe "User/Vendor is logged in" do
  before do
    login_user(vendors(:polar_queen))
  end

  it "should show the new form" do
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
        } }
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
              } }
            }.must_change 'Product.count', 1
          end

          it "should delete a product and redirect to product list" do skip
            assert_difference 'Product.count', -1 do
              delete :destroy, {id: products(:ice_floe).id }
              # product_path(products(:ice_floe).id)
              # must_redirect_to products_path
            end
          end

          it "should get edit" do
            get edit_product_path(product.id)
            must_respond_with :success
          end
        end


      end
