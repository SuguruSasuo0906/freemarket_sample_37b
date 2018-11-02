class AddressesController < ApplicationController
  def new
    if user_signed_in?
      @user = User.find(params[:user_id])
      @address = Address.new
    else
      redirect_to users_path
    end
  end

  def create
    @user = User.find(current_user.id)
    @address = Address.new(address_params)
    @address.user_id = current_user.id
    if @address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def address_params
    params.require(:address).permit(:family_name,:first_name,:family_name_kana,:first_name_kana,:postal_code,:prefecture,:city,:street_number, :building, :telephone)
  end
end
