class ProductsController < ApplicationController



  def index
  end
  
  def new
    authenticate_user!
    @product = Product.new
    @product.product_images.new

  end

  def create
    @product = Product.new(product_params)
    if @product.save! 
      redirect_to root_path
    else
      redirect_to new_product_path
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :category_id, :brand_id, :condition, :delivery_charge, :delivery_origin, :shipping_date, :price, product_images_attributes: [:image]).merge(user_id: current_user.id)
  end
end

