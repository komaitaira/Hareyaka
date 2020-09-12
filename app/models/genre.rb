class Genre < ApplicationRecord
  has_many :articles, dependent: :destroy
  validates :genre_name, presence: true, length: { maximum: 15 }
end
