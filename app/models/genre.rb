class Genre < ApplicationRecord
  has_many :articles
  validates :genre_name, presence: true, length: { maximum: 15 }
end
