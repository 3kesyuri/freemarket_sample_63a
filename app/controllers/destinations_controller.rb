class DestinationsController < ApplicationController
  before_action :set_user_destination

  def index

    if @user_dest.present?

    else
      @destination = Destination.new
    end
  end

  def create
    @destination = Destination.new(destination_params)

    if @destination.save
      redirect_user_index
    else
      redirect_user_dest_index
    end
  end

  def update
    if @user_dest.update(destination_params)
      redirect_user_index
    else
      redirect_user_dest_index
    end
  end

  private

  def destination_params
    params.require(:destination).permit(:family_name, :last_name, :family_name_kana, :last_name_kana, :zip_code, :prefecture, :municipality, :address, :apartment_name, :phone_number).merge(user_id: current_user.id)
  end

  def set_user_destination
    @user_dest = Destination.find_by(user_id: current_use.idr)
  end

  def redirect_user_dest_index
    redirect_to user_destinations_path(current_user.id)
  end

end
