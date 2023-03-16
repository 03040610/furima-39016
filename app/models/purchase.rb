class Purchase < ApplicationRecord
  has_one :place
  belongs_to :item
  belongs_to :user
end
