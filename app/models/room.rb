class Room < ApplicationRecord
  has_many :user_entries, dependent: :destroy
  has_many :user_messages, dependent: :destroy
  has_many :company_entries, dependent: :destroy
  has_many :company_messages, dependent: :destroy
  has_many :notifications, dependent: :destroy
end
