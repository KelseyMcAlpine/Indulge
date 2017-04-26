require "test_helper"

describe OrdersController do

  describe "successfully gets all pages related to the orders controller" do

    it "must get index page" do
      get orders_path
      must_respond_with :success
    end

    it "must get the current order's show page (cart)" do
      get order_path
      must_respond_with :success
    end

  end


  describe "add_product_order" do

    it "if there is not current order (cart), a new one will be created" do skip

    end

    it "a product can be added to the current order (cart)" do

    end

    it "a product must have enough inventory to be added to the current order (cart)" do

    end

    it "adding a product to a current order (cart) changes the product's inventory" do

    end

    it "adding a product to a current order (cart), creates an order_product" do

    end

    it "if a product is successfully added to a current order (cart), the user is redirected to the homepage" do

    end

    it "if a product with the same product_id is added to a current order (cart), the order_product quantity is increased by 1" do

    end

  end


  describe "remove_product_order" do

    it "if the quantity of the order_product is greater than one, the quantity is decreased by 1" do

    end

    it "if the quantity of the order_product is less than one, destroy the order_product" do

    end

  end


  describe "clear_cart" do

    it "must remove all order_products associated with the current order (cart)" do

    end

    it "must change the number of order_products" do

    end

    it "must render a new view of the current cart" do

    end

  end


  describe "checkout" do

    it "will get the checkout form if you have more than one order_products associated with the current cart" do

    end

    it "will redirect to the homepage if you have no order_products associated with the current cart" do

    end

  end


  describe "update" do

    it "reduces the number of inventory for each product" do

    end

    it "changes the order state from pending to paid" do

    end

    it "clears the current cart" do

    end

    it "starts a new cart" do
      
    end
  end

end
