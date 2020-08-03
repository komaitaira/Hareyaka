class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following
  has_many :articles
  # has_many :c_active_notifications, class_name: 'Notification', foreign_key: 'company_id', dependent: :destroy
  # has_many :c_passive_notifications, class_name: 'Notification', foreign_key: 'company_id', dependent: :destroy
  has_many :notifications, dependent: :destroy
  attachment :profile_image
  attachment :background_image

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end
end
