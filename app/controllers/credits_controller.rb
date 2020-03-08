class CreditsController < ApplicationController

  def new
    if !set_credit_id.nil?
      set_credit_id
      redirect_credit_show
    end
  end

  def show
    set_credit_id
  end

  def pay #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) #念の為metadataにuser_idを入れましたがなくてもOK
      @card = CreditCard.new(user_id: current_user.id, name: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end








  private
  def set_credit_id
    @credit = CreditCard.where(user_id: current_user.id).first
  end

  def redirect_credit_show
    redirect_to credit_path(@credit.id)
  end

end
