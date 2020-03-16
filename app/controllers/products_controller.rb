class ProductsController < ApplicationController



  def index
  end
  
  def new
    authenticate_user!
    @product = Product.new
    render layout: 'application'
  end

  def create
  end

  def show
    set_product_images
  end


  private
  def set_product_images
    @product_images = ProductImage.where(product_id: params[:id])
  end
end
