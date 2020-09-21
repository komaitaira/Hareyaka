class Article < ApplicationRecord
  belongs_to :company
  belongs_to :genre
  has_many :favorites, dependent: :destroy

  validates :title, presence: true, length: { maximum: 35 }
  validates :body, presence: true

  attachment :image

  # 掲載ステータスが有効かつジャンルが有効になっている記事のみ探す
  def self.all_active
    where(is_active: true).joins(:genre).where(genres: {is_active: true})
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end