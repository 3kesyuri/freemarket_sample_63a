class PurchasesController < ApplicationController
  def index
    set_destination
    set_product_amount
    set_credit_id
    set_product_id
  
    if !@credit.blank?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(@credit.name)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(@credit.card_id)
    end
  end

  def pay
    set_credit_id
    set_purchase_amaout
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    :amount => @amount, 
    :customer => @credit.name, 
    :currency => 'jpy', 
  )

  #商品の出品状態を切替（0は売れたので表示しない）
  set_product_id
  product = Product.find_by(@product_id)
  product.condition = 0
  product.save
  redirect_to root_path
  end

  private
  def set_credit_id
    @credit = CreditCard.where(user_id: current_user.id).first
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
