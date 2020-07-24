class Article < ApplicationRecord
  belongs_to :company
  belongs_to :genre
  has_many :favorites

  attachment :image
end
