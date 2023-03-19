class PurchasePlace 
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :prefecture_id, :city, :address, :phone_number, :building_name, :post_code

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :prefecture_id, numericality: { only_integer: true, greater_than: 1 }
    validates :city
    validates :address
    validates :phone_number,  length: { minimum: 10, maximum: 11 }, numericality: { only_integer: true }
    validates :post_code,     format: { with: /\A\d{3}-\d{4}\z/ }
  end
  
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    item = Item.find(item_id)
    item.update(prefecture_id: prefecture_id)
    place = Place.new(city: city, address: address, phone_number: phone_number, building_name: building_name, post_code: post_code)
    if place.valid?
      place.save
      purchase.update(place_id: place.id)
    end
  end 
end