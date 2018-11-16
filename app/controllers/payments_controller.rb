class PaymentsController < ApplicationController
  before_action :set_user
  before_action :move_to_sign_in
  before_action :move_to_mypage
  layout "mypages", only: [:edit]
  layout "create", only: [:new]

  def new
  end

  def create
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    customer = Payjp::Customer.create(
      card: params['payjp-token']
    )
    @payment = Payment.new(customer_id: customer.id, user_id: current_user.id)

    unless @payment.save
      render 'new'
    end
  end

  def edit
    if @user.payment
      @payment = @user.payment
    else
      @payment = Payment.new(user_id: @user.id)
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_mypage
    redirect_to root_path if current_user.payment.present?
  end

end
