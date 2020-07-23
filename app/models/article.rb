class Article < ApplicationRecord
  belongs_to :company
  belongs_to :genre
end
