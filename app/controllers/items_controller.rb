class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    #@item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

end
private 
  def item_params
    params.require(:item).permit(:item_name, :item_column, :item_price, :image, :item_category_id, :item_status_id, :delivery_charge_id, :prefecture_id, :item_date_id).merge(user_id: current_user.id)
  end