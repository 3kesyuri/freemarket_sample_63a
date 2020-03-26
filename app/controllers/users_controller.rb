class UsersController < ApplicationController

  def show
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    if current_user.update(user_params)
      redirect_user_index
    else
      redirect_user_index
    end
    
  end

  def logout
  
  end

  private

  def user_params
    params.require(:user).permit(:nickname,:family_name,:last_name,:family_name_kana,:last_name_kana,:email)
  end
end
