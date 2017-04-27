require "test_helper"

describe OrdersController do

  describe "Guest user" do

    it "not allowed to get index page" do
      get orders_path
      must_respond_with :redirect
    end

    describe "can add_product_order" do
      let (:order) {orders(:my_order)}
      let (:product) {products(:my_product)}

      # before do
      #   order.add_product_order(product)
      # end

      it "a product can be added to the current order (cart)" do skip

      end

      it "reduces the number of inventory for each product" do
        proc {
          post product_add_to_cart_path(product.id)
        }.must_change 'order.order_products.first.quantity', 1
      end

      it "a product must have enough inventory to be added to the current order (cart)" do skip

      end

      it "adding a product to a current order (cart) changes the product's quantity " do skip

      end

      it "adding a product to a current order (cart), creates an order_product" do skip

      end

      it "if a product is successfully added to a current order (cart), the user is redirected to the homepage" do skip

      end

      it "if a product with the same product_id is added to a current order (cart), the order_product quantity is increased by 1" do skip

      end

    end


    describe "remove_product_order" do

      it "if the quantity of the order_product is greater than one, the quantity is decreased by 1" do skip

      end

      it "if the quantity of the order_product is less than one, destroy the order_product" do skip

      end

      it "increases vendor's product inventory" do skip

      end

    end


    describe "clear_cart" do

      it "must remove all order_products associated with the current order (cart)" do skip

      end

      it "must change the number of order_products" do skip

      end

      it "must render a new view of the current cart" do skip

      end

    end


    describe "checkout" do

      it "will get the checkout form if you have more than one order_products associated with the current cart" do skip

      end

      it "will redirect to the homepage if you have no order_products associated with the current cart" do skip

      end

    end


    describe "update (purchase)" do


      it "changes the order status from pending to paid" do skip

      end

      it "clears the current cart" do skip

      end

      it "starts a new cart" do skip

      end

      it "redirects to the confirmation page" do skip

      end

    end

  end





  describe "logged in user" do

     before do
       login_user(vendors(:polar_queen))
     end
  end

end
