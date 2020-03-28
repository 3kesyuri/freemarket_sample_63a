class TestsController < ApplicationController

  def index
    @product = Product.new
    @product.product_images.new
  end

  def create
    #@brand = Brand.new(name: "fake")
    #@brand.save!
    test_pro = Product.new(product_params)
    if test_pro.save!
      redirect_to root_path
    else
      redirect_to tests_path
    end
  end

  def product_params
    params.require(:product).permit(:name,:description,:condition,:delivery_charge,:delivery_origin,:shipping_date,:price,:category_id,:brand_id,product_images_attributes: [:image]).merge(user_id: current_user.id)
  end
end
