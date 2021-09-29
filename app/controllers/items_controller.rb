class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:new]
  

  def index
    # @item = Item.all
  end

  def new
    @item = Item.new
    # @articles = Article.order("created_at DESC")
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :comment, :item_category_id, :item_show_id, :delivery_address_id, :delivery_pay_id, :delivery_day_id, :pay, :image).merge(user_id: current_user.id)
  end
end
