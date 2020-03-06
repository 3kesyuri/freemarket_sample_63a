class ProductsController < ApplicationController

  before_action :authenticate_user!

  def index
  end
  
  def new
    @product = Product.new
    render layout: 'application'
  end

  def create
  end


end
