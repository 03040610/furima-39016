class PurchaseController < ApplicationController
  def index
    @purchase_place = PurchasePlace.new
    @item = Item.find(params[:item_id])
  end
  
  def create
    @purchase_place = PurchasePlace.new(purchase_params)
    @item = Item.find(params[:item_id])
    if @purchase_place.valid? && @item.present?
      ActiveRecord::Base.transaction do
        @purchase_place.save!
        @item.update!(purchased: true)
      end
      redirect_to root_path
     else
       render :index
     end
   end
  
  private
  
   def purchase_params
    params.require(:purchase_place).permit(:user_id, :item_id, :prefecture_id, :city, :address, :phone_number, :building_name, :post_code)
   end
end

