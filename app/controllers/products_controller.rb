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
    set_product_info
  end


  private
    def set_product_images
      @product_images = ProductImage.where(product_id: params[:id])
    end
    
    def set_product_info
      @product_info = Product.find_by(id: params[:id])
    end
end
