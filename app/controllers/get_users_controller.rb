class GetUsersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:id])
  end

  def new
    @buy_item_get_user = BuyItemGetUser.new
  end

  def create
    @buy_item_get_user = BuyItemGetUser.new(get_user_params)
    if @buy_item_get_user.valid?
      @buy_item_get_user.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def get_user_params
    params.permit(:postal_code, :delivery_address_id, :address_city, :address_number, :telephone_number).merge(user_id: current_user.id)
  end
end
