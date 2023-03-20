class PurchaseController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :purchase, only: [:index,:create]
  
  def index
    @purchase_place = PurchasePlace.new
    if (user_signed_in?) && (@item.user_id == current_user.id)
      redirect_to root_path
    elsif (user_signed_in?) && (current_user.id != @item.user_id) && (@item.purchase.present?)
      redirect_to root_path
    end
  end
  
  def create
    @purchase_place = PurchasePlace.new(purchase_params)
    if @purchase_place.valid? && @item.present?
       @purchase_place.save
       pay_item
      redirect_to root_path
    else
       render :index
    end
  end
  private

   def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.item_price,  
      card: purchase_params[:token],    
      currency: 'jpy'                 
    )
   end

   def purchase_params
    params.require(:purchase_place).permit(:prefecture_id, :city, :address, :phone_number, :building_name, :post_code).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
   end

   def purchase
    @item = Item.find(params[:item_id])
   end
  end