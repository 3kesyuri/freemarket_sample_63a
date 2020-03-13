class CreditsController < ApplicationController

  def new
    if !set_credit_id.nil?
      set_credit_id
      redirect_credit_show
    end
  end

  def show
    set_credit_id
    if @credit.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@credit.name)
      @default_card_information = customer.cards.retrieve(@credit.card_id)
    end
  end

  def pay 
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) 
      @card = CreditCard.new(user_id: current_user.id, name: customer.id, card_id: customer.default_card)
      if @card.save
        set_credit_id
        redirect_credit_show
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete 
    set_credit_id
    if !@credit.blank?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@credit.name)
      customer.delete
      @credit.delete
    end
    redirect_credit_new
  end

  private
  def set_credit_id
    @credit = CreditCard.where(user_id: current_user.id).first
  end

  def redirect_credit_show
    redirect_to credit_path(@credit.id)
  end

  def redirect_credit_new
    redirect_to  new_user_credit_path(current_user.id)
  end

end
