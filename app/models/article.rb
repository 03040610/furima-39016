class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category_id
  validates :item_category_id, numericality: { other_than: 1, message: "can't be blank" } 
end
