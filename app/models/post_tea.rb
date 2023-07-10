class PostTea < ApplicationRecord
  belongs_to :customer
  belongs_to :genre
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_customers, through: :favorites, source: :customer

  has_one_attached :image
  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end

  validates :genre_id, presence: true
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @post_tea = PostTea.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @post_tea = PostTea.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @post_tea = PostTea.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @post_tea = PostTea.where("title LIKE?","%#{word}%")
    else
      @post_tea = PostTea.all
    end
  end

  scope :created_today, -> { where(created_at: Time.zone.now.all_day) }
  scope :created_yesterday, -> { where(created_at: 1.day.ago.all_day) }
  scope :created_this_week, -> { where(created_at: 6.day.ago.beginning_of_day..Time.zone.now.end_of_day) }
  scope :created_last_week, -> { where(created_at: 2.week.ago.beginning_of_day..1.week.ago.end_of_day) }


end
