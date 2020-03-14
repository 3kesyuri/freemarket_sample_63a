class PurchasesController < ApplicationController
  def index
    set_destination
    set_product_amount
    set_credit_id
    set_product_id
  
    if !@credit.blank?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@credit.name)
      @default_card_information = customer.cards.retrieve(@credit.card_id)
    end
  end

  def pay
    set_credit_id
    set_purchase_amaout
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
      amount: @amount, 
      customer: @credit.name, 
      currency: 'jpy', 
    )

    set_product_id
    product = Product.find_by(@product_id)
    product.condition = 0
    
    if product.save
      redirect_to root_path
    else
      redirect_to product_purchases(@porduct_id)
    end

  end

  private
  def set_credit_id
    @credit = CreditCard.find_by(user_id: current_user.id)
  end

  def set_destination
    @destination = Destination.find_by(user_id: current_user.id)
  end

  def set_product_amount
    @product_amount = Product.find_by(id: params[:product_id]).price
  end

  def set_purchase_amaout
    @amount = params[:amount]
  end

  def set_product_id
    @porduct_id = params[:product_id]
  end

end
