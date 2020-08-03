class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :favorites
  has_many :favorite_articles, through: :favorites, source: :article
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower
  # has_many :u_active_notifications, class_name: 'Notification', foreign_key: 'user_id', dependent: :destroy
  # has_many :u_passive_notifications, class_name: 'Notification', foreign_key: 'user_id', dependent: :destroy
  has_many :notifications, dependent: :destroy
  attachment :profile_image

  def full_name
    last_name + " " + first_name
  end

  def kana_full_name
    kana_last_name + " " + kana_first_name
  end
end