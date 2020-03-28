class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create, :get_category_children, :get_category_grandchildren]

  def index
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
    @product = Product.new(product_params)
    if @product.save!
      @product.status == :sale
      redirect_to root_path
    else
      redirect_to new_product_path
    end
  end

  def get_category_children
    @category_children = Category.find(params[:parent_name]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end
  
  private

  def product_params
    params.require(:product).permit(:name, :description, :category_id, :brand_id, :condition, :delivery_charge, :delivery_origin, :shipping_date, :price, :status, product_images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
