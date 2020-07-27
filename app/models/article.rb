class Article < ApplicationRecord
  belongs_to :company
  belongs_to :genre
  has_many :favorites

  attachment :image

  # articles: { is_active: true }かつ、article_idでグループ化し検索した結果を多い順に並び替え、３つまで表示
  def self.create_all_ranks
    Article.find(
      Favorite.joins(:article).where(articles: { is_active: true }).group(:article_id)
      .order('count(article_id) desc').limit(3).pluck(:article_id)
    )
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
