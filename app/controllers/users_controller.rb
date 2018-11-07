class UsersController < ApplicationController
layout "mypages", only: [:identification]
before_action :set_user

  def show
  end

  def logout
  end

  def profile
  end
  
  def identification
  end

  def update
    if  @user.id == current_user.id
      @user.update(user_params)
        redirect_to profile_user_path, notice: '変更出来ました'
    else
      redirect_to root_path
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
