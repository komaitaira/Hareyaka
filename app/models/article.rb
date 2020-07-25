class Article < ApplicationRecord
  belongs_to :company
  belongs_to :genre
  has_many :favorites

  attachment :image

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
