class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]


  def index
    @item = Items.all
  end

  def new
   @item = Items.new
  end


  private

  def item_params
    params.require(:).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end
