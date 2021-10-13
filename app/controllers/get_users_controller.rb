class GetUsersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create]


  def index
    @buy_item_get_user = BuyItemGetUser.new
    redirect_to root_path if current_user == @item.user || @item.buy_item != nil
  end

  def create
    @buy_item_get_user = BuyItemGetUser.new(get_user_params)

    if @buy_item_get_user.valid?
      pay_item
      @buy_item_get_user.save
      redirect_to root_path
    else  
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def get_user_params
    params.require(:buy_item_get_user).permit(:postal_code, :delivery_address_id, :address_city, :address_number, :telephone_number).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
    amount: @item.pay,   # 商品の値段
    card: get_user_params[:token],    # カードトークン
    currency: 'jpy'                   # 通貨の種類（日本円）
  )
  end
end
