require "test_helper"

describe CategoryItem do
  let(:category_item) { CategoryItem.new }

  it "must be valid" do
    value(category_item).must_be :valid?
  end
end
