class UsersController < ApplicationController
  #before_action :authenticate_user!

  def index
  end
  
  def show
    @user = User.find(current_user.id)
  end

  def update
    if current_user.update(user_params)
      redirect_user_index
    else
      redirect_user_index
    end
    
  end

  private

  def user_params
    params.require(:user).permit(:nickname,:family_name,:last_name,:family_name_kana,:last_name_kana,:email)
  end

  def redirect_user_index
    redirect_to user_path(current_user.id)
  end

end
