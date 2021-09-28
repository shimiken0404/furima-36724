class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]


  def index
    @item = Items.all
  end

  def new
   @item = Items.new(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:title, :comment, :item_category_id, :item_show_id, :delivery_address_id, :delivery_pay_id, :delivery_day_id, :pay, :image).merge(user_id: current_user.id)
  end
end
