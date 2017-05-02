require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest

  describe ProductsController do
    let(:product) {products(:my_product)}
    let(:sample_category) {categories(:exotic)}

    let(:vendor) {vendors(:Dwight)}
    let(:vendor2) {vendors(:polar_queen)}


    describe "User is not logged in" do

      it "should get index" do
        get products_path
        must_respond_with :success
      end

      it "should filter by category" do
        get category_products_path(sample_category.id)
        must_respond_with :success
      end

      it "should filter by vendor" do
        get vendor_products_path(vendor2.id)
        must_respond_with :success
      end

      it "should fail to update a product when vendor not logged in" do
        put product_path(products(:my_product).id), params: {product: {name: "nature break", description: "Relaxing", price: 5}}
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

      it "should not be able to add a product when not logged in" do
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

      it "should not be able to delete a product when not logged in" do
        delete  product_path(products(:ice_floe).id)
        must_respond_with :redirect
        must_redirect_to root_path
      end

      it "should show one product" do
        get product_path(product.id)
        must_respond_with :success
      end

      it "should not get edit when not logged in" do
        get edit_product_path(product.id)
        must_respond_with :redirect
        must_redirect_to root_path
      end
    end


    describe "User/Vendor is logged in" do
      before do
        login_user(vendors(:polar_queen))
      end
      let(:product) {products(:ice_floe)}

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
        must_redirect_to vendor_path
        flash.now[:success].must_equal "New product successfully added"
      end

      it "should update a product when vendor is logged in" do
        updating_product = Product.last

        product_data = {
          product: {
            name: updating_product.name + " addition",
            price: updating_product.price
          }
        }
        put product_path(updating_product.id), params: product_data
        must_redirect_to product_path(updating_product.id)

      end

      it "should not update a product when vendor is logged in with invalid validations" do skip 
        updating_product = Product.last

        product_data = {
          product: {
            name: updating_product.name + " addition"
          }
        }
        put product_path(updating_product.id), params: product_data

      flash[:failure].must_equal "An error has occurred"
      #assert_template :edit

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
        flash.now[:error].must_equal "Hmm.. something went wrong."

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
        flash.now[:error].must_equal "Hmm.. something went wrong."

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

      end

      it "Vendor cannot update attributes of another vendor's products" do
        product = products(:my_product)
        vendor = vendors(:polar_queen)
        proc {
          get edit_product_path, params:  { product:
            {id: product.id,
              vendor_id: vendor.id
            }
          }
        }
        must_respond_with :redirect
      end

      it "Retire will affect product as unavailable from product list" do
        product = products(:ice_floe)
        vendor = vendors(:polar_queen)
        puts product.lifecycle
        puts product.vendor.username

        post update_availability_product_path(product.id),  params: {
          id: product.id,
          vendor_id: vendor.id,
          lifecycle: product.lifecycle
        }
        product.reload
        puts product.lifecycle
        product.lifecycle.must_equal "unavailable"



      end

      it "Retire will not affect product with invalid parameters" do

        updating_product = Product.last
        puts updating_product.lifecycle

        product_data = {
          product: {
            name: updating_product.name + " addition"
          }
        }
        put product_path(updating_product.id), params: product_data

      flash[:failure].must_equal "An error has occurred"


        #
        # product = products(:ice_floe)
        # # vendor = vendors(:polar_queen)
        # puts product.lifecycle
        # puts product.vendor.username
        #
        # post update_availability_product_path(product.id),  params: {
        #   id: product.id,
        #   price: 0
        # }
        # product.reload
        # puts product.lifecycle
        # product.lifecycle.must_equal "available"


      end

      it "Relist will restore product as available" do
        product = products(:ice_floe)
        vendor = vendors(:polar_queen)
        # puts "#{product.lifecycle}"
        # puts "#{product.vendor.username}"

        post update_availability_product_path(product.id), params:  {
          id: product.id,
          vendor_id: vendor.id,
          lifecycle: product.lifecycle
        }
        product.reload
        product.lifecycle.must_equal "unavailable"

        post update_availability_product_path(product.id), params:  {
          id: product.id,
          vendor_id: vendor.id,
          lifecycle: product.lifecycle
        }
        product.reload
        product.lifecycle.must_equal "available"
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
        must_redirect_to vendor_path
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
        delete product_path(product.id)
        # product_path(products(:ice_floe).id)
        must_redirect_to vendor_path
      end

      it "should get edit" do
        get edit_product_path(product.id)
        must_respond_with :success
      end

    end
  end
end
