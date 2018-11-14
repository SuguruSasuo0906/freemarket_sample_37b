class ItemsController < ApplicationController


  def index
    @items = Item.includes(:user).order('created_at DESC').limit(4)
  end

  def new
    @item = Item.new
    @item.build_delivery
    @item.photos.build
  end

  def create
    @item = Item.new(item_params)
    @item.deal_condition = 1
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @user_items = Item.where(user_id: @item.user_id).limit(6).order("created_at DESC")
    @delivery = Delivery.where(item_id: @item.id)
  end

  private

  def item_params
    params.require(:item).permit(
      :name,
      :price,
      :introduction,
      :large_category_id,
      :medium_category_id,
      :small_category_id,
      :size_id,
      :brand_id,
      :condition,
      photos_attributes: [:id, :photo_url],
      delivery_attributes: [:id, :shipping_burden, :origin_region, :shipping_days, :shipping_method]
      ).merge(user_id: current_user.id)
  end
end
