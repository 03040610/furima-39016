class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_status
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :item_date
  
  validates :item_category,     numericality: { other_than: 1, message: "can't be blank" } 
  validates :item_status,       numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_charge,   numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture,        numericality: { other_than: 1, message: "can't be blank" }  
  validates :item_date,         numericality: { other_than: 1, message: "can't be blank" } 
end

