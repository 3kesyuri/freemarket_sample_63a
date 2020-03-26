class ProductsController < ApplicationController
before_action :set_product_images, :set_product_info,only: :show


  def index
    @products = Product.where(category_id: "1")
  end
  
  def new
    authenticate_user!
    @product = Product.new
    render layout: 'application'
  end

  def create
  end

  def show
    @brand = Brand.find(@product_info.brand_id)
    @category = Category.find(@product_info.category_id)
  end


  private
    def set_product_images
      @product_images = ProductImage.where(product_id: params[:id])
    end
    
    def set_product_info
      @product_info = Product.find_by(id: params[:id])
    end
end
