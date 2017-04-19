require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest

  describe ProductsController do
    let(:product) {products(:my_product)}

      it "should get index" do
        get products_path
        must_respond_with :success
      end

      it "should get show" do
        get product_path(product.id)
        must_respond_with :sucess
      end

      it "should show 404 when product not found" do
        get product_path(0) # need to edit controller to show 404
        must_respond_with :missing
      end
    end

end
