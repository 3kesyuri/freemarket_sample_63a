class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create]



  def index
  end
  
  def new
    authenticate_user!
    @product = Product.new
    @product.product_images.new
  end

  def create
    image_presence
    if @image.present?

      @product = Product.new(product_params)
      if @product.save!
        @product.status == :sale
        redirect_to root_path
      else
        redirect_to new_product_path
      end
    else
      @product = Product.new
      @product.product_images.new
      render :new
    end
  end

  def edit
  end

  def update
    image_presence
    if @image.present?

      if @product.update(product_params)
        redirect_to root_path
      else
        render :edit
      end
    
    else
      render :edit
    end
  end

  def delete
  end

  
  private

  def product_params
    params.require(:product).permit(:name, :description, :category_id, :brand_id, :condition, :delivery_charge, :delivery_origin, :shipping_date, :price, :status, product_images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def image_presence
    @image = params.require(:product).permit(product_images_attributes: [:image, :_destroy, :id])
  end

end


