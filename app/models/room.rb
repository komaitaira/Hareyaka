class Room < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_many :messages, dependent: :destroy
  has_many :notifications, dependent: :destroy
end
