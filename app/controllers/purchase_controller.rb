class PurchaseController < ApplicationController
  def index
    @purchase_place = PurchasePlace.new
    @item = Item.find(params[:item_id])
  end
  
  def create
    @purchase_place = PurchasePlace.new(purchase_params)
    @item = Item.find(params[:item_id])
    if @purchase_place.valid? && @item.present?
       @purchase_place.save
       pay_item
      redirect_to root_path
    else
       render :index
    end
  end
  private
  
   def purchase_params
    params.require(:purchase_place).permit(:user_id, :item_id, :prefecture_id, :city, :address, :phone_number, :building_name, :post_code).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
   end

   def pay_item
    Payjp.api_key = "sk_test_57e58e3d3e54002e3c8d16f5" 
    Payjp::Charge.create(
      amount: @item.item_price,  
      card: purchase_params[:token],    
      currency: 'jpy'                 
    )
   end
end

