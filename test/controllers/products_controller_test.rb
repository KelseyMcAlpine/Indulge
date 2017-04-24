require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest

  describe ProductsController do
    let(:product) {products(:ice_floe)}
    # let(:product) {products(:my_product)}
    let(:sample_category) {categories(:exotic)}

    it "should get index" do
      get products_path
      must_respond_with :success
    end

    it "index displays all the products for a vendor" do skip
      get vendor_path, vendor_id: vendors(:polar_queen).id
      must_respond_with :success
    end

      it "should filter by category" do
        get category_products_path(sample_category.id)
        must_respond_with :success
      end

      it "should get show" do skip
        get product_path(product.id)
        must_respond_with :success
      end

    it "should show 404 when product not found" do
      get product_path(0)
      must_respond_with :missing
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
          vendor_id: product.vendor_id
          } }
          must_redirect_to products_path
        end

        it "should affect the model when creating a product" do skip
          proc {
            post products_path, params:  { product:
              { name: "Ski trip",
                price: products(:ice_floe).price,
                inventory: "2",
                description: "hehe",
                photo_url: products(:ice_floe).photo_url,
                lifecycle: "2",
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

            it "should show one product" do skip
              get product_path(product.id)
              must_respond_with :success
            end

            it "should get edit" do
              get edit_product_path(product.id)
              must_respond_with :success
            end
          end



        end
