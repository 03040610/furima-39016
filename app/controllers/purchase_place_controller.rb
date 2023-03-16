class PurchasePlaceController < ApplicationController
  def index
    @purchase_place = PurchasePlace.new
    @item = Item.all
  end
  
  def create
    @purchase_place = PurchasePlace.new(purchase_params)
     if @purchase_place.valid?
      @purchase_place.save
      redirect_to root_path(@purchase_place)
     else
       render :index
     end
   end
  
  private
  
   def purchase_params
     params.require(:purchase_place).permit(:user_id, :item_id, :prefecture_id, :city, :address, :phone_number, :building_name, :post_code)
   end
end

