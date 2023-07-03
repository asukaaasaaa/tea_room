class Genre < ApplicationRecord
  has_many :post_teas, dependent: :destroy

  validates :name, presence: true
end
