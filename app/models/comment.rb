class Comment < ApplicationRecord
  belongs_to :customer
  belongs_to :post_tea

  validates :comment, presence: true
end
