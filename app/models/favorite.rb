class Favorite < ApplicationRecord
  belongs_to :customer
  belongs_to :post_tea

  validates_uniqueness_of :post_tea_id, scope: :customer_id
end
