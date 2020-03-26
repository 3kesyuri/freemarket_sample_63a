class ProductsController < ApplicationController



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
  end


end
