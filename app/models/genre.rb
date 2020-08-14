class Genre < ApplicationRecord
  has_many :articles

  validates :genre_name, presence: true
  # validates :is_active, presence: true

  # scope :only_active, -> { where(is_active: true) }
end
