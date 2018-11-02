class UsersController < ApplicationController
  def show
  end

  def logout
    @user = User.new(params[:id])
  end
end
