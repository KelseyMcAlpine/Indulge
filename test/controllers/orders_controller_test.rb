describe OrdersController do
  let (:order) {orders(:order1)}


  describe "Guest user" do

    it "not allowed to get index page" do
      get orders_path
      must_respond_with :redirect
    end

    describe "can add_product_order" do
      let (:product) {products(:my_product)}
      let (:product1) {products(:one_product)}

      # before do
      #   order.add_product_order(product)
      # end

      it "a product can be added to the current order (cart) and creates an OrderProduct" do
        proc {
          post product_add_to_cart_path(product.id)
        }.must_change 'OrderProduct.count', 1

      end

      it "reduces the number of inventory for each product" do
        start = product.inventory
        post product_add_to_cart_path(product.id)
        finish = Product.find(product.id).inventory
        start.wont_equal finish
      end

      it "a product must have enough inventory to be added to the current order (cart)" do skip
        # current create method isn't removing one from the inventory
        Rails.application.env_config["HTTP_REFERER"] = products_path
        post product_add_to_cart_path(product1.id)
        post product_add_to_cart_path(product1.id)
        must_redirect_to product_path(product1.id)
      end

      it "if a product is successfully added to a current order (cart), the user is redirected to back" do skip
        proc {
          post product_add_to_cart_path(product.id)
        }.must_respond_with :success
    end


      it "if a product with the same product_id is added to a current order (cart), the order_product quantity is increased by 1" do
        post product_add_to_cart_path(product.id)
        proc {
          post product_add_to_cart_path(product.id)
        }.must_change 'OrderProduct.find(product.id).quantity', 1
      end

    end

    describe "update (purchase)" do

      let (:order) {orders(:my_order)}

      it "changes the order status from pending to paid" do
        post order_purchase(order.id)
        order.status.must_equal "paid"
      end

      it "clears the current cart" do skip

      end

      it "starts a new cart" do skip

      end

      it "redirects to the confirmation page" do skip

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


    # describe "clear_cart" do
    #
    #   it "must remove all order_products associated with the current order (cart)" do skip
    #
    #   end
    #
    #   it "must change the number of order_products" do skip
    #
    #   end
    #
    #   it "must render a new view of the current cart" do skip
    #
    #   end
    #
    # end


    describe "checkout" do

      it "will get the checkout form if you have more than one order_products associated with the current cart" do
        get order_checkout_path(order.id)
        must_respond_with :success

      end

      it "will redirect to the homepage if you have no order_products associated with the current cart" do skip


      end

    end

  end
end
