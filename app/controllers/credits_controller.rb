class CreditsController < ApplicationController

  def new
    if set_credit_id.nil?
    else
      set_credit_id
      redirect_to credit_path(@credit.id)
    end
  end

  def show
    set_credit_id
  end

  private

  def set_credit_id
    @credit = CreditCard.where(user_id: current_user.id).first
  end

end
