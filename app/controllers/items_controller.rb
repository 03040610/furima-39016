class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :move_to_index, only: [:edit]
  before_action :set_item, only: [:edit, :update, :show]

  def index
    @item = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end
  
  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to item_path
    else
      render :edit
    end
  end

  def show
    @item = Item.find(params[:id])
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
      params.require(:item).permit(:item_name, :item_column, :item_price, :image, :item_category_id, :item_status_id, :delivery_charge_id, :prefecture_id, :item_date_id).merge(user_id: current_user.id)
    end
    def move_to_index
      @item=Item.find(params[:id])
      if (user_signed_in?) && (current_user.id != @item.user_id)
        redirect_to action: :index
      end
    end
    def set_item
      @item = Item.find(params[:id])
    end
end