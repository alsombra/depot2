require 'test_helper'

class ProductTest < ActiveSupport::TestCase
fixtures :products
  def new_product(image_url)
    Product.new(title:  "My Book Title",
                description:  "yyy",
                price: 1,
                image_url: image_url)
  end
  test "image url" do
    ok = %w{fred.gif fred.jpg fred.png FRED.JPG FRED.jpg
            http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }
    ok.each do |name|
      assert new_product(name).valid?, "#{name} should be valid"
    end
    bad.each do |name|
      assert new_product(name).invalid?, "#{name} shouldn't be valid"
    end
  end
  test "product is not valid without a unique title" do
    product = Product.new(title:  products(:ruby).title,
    description: "yyy",
    price: 1,
    image_url:  "fred.gif")
    assert product.invalid?
    assert_equal ["has already been taken"], product.errors[:title]
  end
end
