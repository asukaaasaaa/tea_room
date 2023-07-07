class Genre < ApplicationRecord
  has_many :post_teas, dependent: :destroy

  validates :name, presence: true

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @genre = Genre.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @genre = Genre.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @genre = Genre.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @genre = Genre.where("name LIKE?","%#{word}%")
    else
      @genre = Genre.all
    end
  end
end
