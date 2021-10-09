class GetUsersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @buy_item_get_user = BuyItemGetUser.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_item_get_user = BuyItemGetUser.new(get_user_params)
    if @buy_item_get_user.valid?
      @buy_item_get_user.save
      redirect_to root_path
    else  
      render :index
    end
  end

  private

  def get_user_params
    params.permit(:postal_code, :delivery_address_id, :address_city, :address_number, :telephone_number).merge(user: current_user.id)
  end
end
