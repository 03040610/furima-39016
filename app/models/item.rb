class Item < ApplicationRecord
  validates :item_name,          presence: true
  validates :item_column,        presence: true
  validates :image,              presence: true
  
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_status
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :item_date
  
  validates :item_category_id,    numericality: { only_integer: true, greater_than: 1 }, presence: true
  validates :item_status_id,      numericality: { only_integer: true, greater_than: 1 }, presence: true
  validates :delivery_charge_id,  numericality: { only_integer: true, greater_than: 1 }, presence: true
  validates :prefecture_id,       numericality: { only_integer: true, greater_than: 1 }, presence: true  
  validates :item_date_id,        numericality: { only_integer: true, greater_than: 1 }, presence: true
end
