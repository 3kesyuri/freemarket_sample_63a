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


end
