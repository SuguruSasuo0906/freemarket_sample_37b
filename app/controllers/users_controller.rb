class UsersController < ApplicationController
layout "read", only: [:identification, :logout]
before_action :set_user

  def show
    @address = @user.address
  end

  def logout
  end

  def profile
  end

  def identification
  end

  def sell
    @items = Item.where(user_id: current_user.id)
  end

  def update
    if @user.id == current_user.id
      if @user.update(user_params)
      flash[:notice] = '変更しました'
      render :profile
      else
        render :profile
      end
    else
      redirect_to :profile_user_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :introduction)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
