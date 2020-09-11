class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_articles, through: :favorites, source: :article, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id, dependent: :destroy
  has_many :followings, through: :active_relationships, source: :follower, dependent: :destroy
  has_many :notifications, dependent: :destroy
  
  validates :last_name, presence: true, length: { maximum: 10 }
  validates :first_name, presence: true, length: { maximum: 10 }
  validates :kana_last_name, presence: true, length: { maximum: 10 }
  validates :kana_first_name, presence: true, length: { maximum: 10 }
  validates :email, presence: true, length: { maximum: 30 }
  validates :postal_code, presence: true, length: { minimum: 7, maximum: 7 }
  validates :address, presence: true, length: { maximum: 30 }
  validates :phone_number, presence: true, length: { maximum: 12 }
  validates :introduction, length: { maximum: 200 }

  attachment :profile_image

  def full_name
    last_name + " " + first_name
  end

  def kana_full_name
    kana_last_name + " " + kana_first_name
  end
end