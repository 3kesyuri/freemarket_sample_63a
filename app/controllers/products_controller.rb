class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create, :get_category_children, :get_category_grandchildren]
  before_action :set_product_images, :set_product_info,only: :show
  
  def index
    @products = Product.where(status: :sale).order("created_at DESC")
  end
  
  def new
    authenticate_user!
    @product = Product.new
    @product.product_images.new
    @category_parent = ["選択してください"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent << parent.name
    end
  end

  def create
    image_presence
    if @image.present?

      @product = Product.new(product_params)
      if @product.save
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

  def get_category_children
    @category_children = Category.find(params[:parent_name]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end
  
  private

  def edit
  end

  def update
      if @product.update(product_params)
        redirect_to root_path
      else
        render :edit
      end
  end

  def delete
  end

  def show
    @brand = Brand.find(@product_info.brand_id)
    @category = Category.find(@product_info.category_id)
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

    def set_product_images
      @product_images = ProductImage.where(product_id: params[:id])
    end
    
    def set_product_info
      @product_info = Product.find_by(id: params[:id])
    end
end
