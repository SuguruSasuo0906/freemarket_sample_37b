class AddressesController < ApplicationController
  def new
    if user_signed_in?
      @user = User.find_by(id: params[:user_id])
      @address = Address.new
    else
      redirect_to users_path
    end
  end

  def create
    @user = User.find_by(id: current_user.id)
    @address = Address.new(family_name: address_params[:family_name], first_name: address_params[:first_name], family_name_kana: address_params[:family_name_kana], first_name_kana: address_params[:first_name_kana], postal_code: address_params[:postal_code], prefecture: address_params[:prefecture], city: address_params[:city], street_number: address_params[:street_number], building:
      address_params[:building], telephone: address_params[:telephone], user_id: current_user.id)
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
