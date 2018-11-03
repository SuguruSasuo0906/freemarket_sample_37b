class AddressesController < ApplicationController
  before_action :set_user

  def new
    if user_signed_in?
      @address = Address.new
    else
      redirect_to users_path
    end
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def address_params
    params.require(:address).permit(:family_name,:first_name,:family_name_kana,:first_name_kana,:postal_code,:prefecture,:city,:street_number, :building, :telephone).merge(user_id: current_user.id)
  end
end
