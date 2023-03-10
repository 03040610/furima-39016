class Item < ApplicationRecord
  validates :item_name,          presence: true
  validates :item_column,        presence: true
  validates :item_category_id,   presence: true
  validates :item_status_id,     presence: true
  validates :delivery_charge_id, presence: true
  validates :prefecture_id,      presence: true
  validates :item_date_id,       presence: true
  validates :item_price,         presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, numericality: { only_integer: true }
  validates :image,              presence: true
  
  has_one_attached :image
  belongs_to :user
end
