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
      redirect_to new_user_payment_path(@user)
    else
      render :new
    end
  end

  def edit
   @address = @user.address

  end

  def update
    @address = @user.address
    if @user.id == current_user.id
       if @address.update(address_params)
        render :edit
      else
        render :edit
      end
    else
      redirect_to root_path
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
