class DealsController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!
  def new
    if current_user.id != @item.user_id
      if current_user.payment && current_user.address
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      @customer = Payjp::Customer.retrieve(current_user.payment.customer_id)
      @payment = Payment.where(user_id: current_user.id)
      else
        flash[:alert] = "住所情報または支払い情報が登録されていません"
        redirect_to user_path(current_user.id)
      end
    else
      redirect_to user_path(current_user.id)
    end
  end

  def create
    if @item.deal_condition == "出品中"
      @item.with_lock do
        payment = Payment.where(user_id: current_user.id)
        payment.each do |pay|
          @payment = pay
        end
        Payjp.api_key = ENV['PAYJP_SECRET_KEY']
        charge = Payjp::Charge.create(
              amount: @item.price,
              customer: @payment.customer_id,
              currency: 'jpy'
            )
        if charge
          @item.update(deal_condition: 2)
          @deal = Deal.new(user_id: current_user.id, item_id: @item.id)
          unless @deal.save
            flash[:alert] = "お買い求めいただいた商品がお支払いただいたにもかかわらずうまく保存されませんでした。下記の運営にお問い合わせください"
            redirect_to user_path(curret_user.id)
          end
        else
          flash[:alert] = "カードエラーです"
          render :new
        end
      end
    else
      flash[:alert] = "売却済の商品です。"
      redirect_to user_path(current_user.id)
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

end
