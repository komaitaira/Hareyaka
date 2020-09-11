class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id, dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :following
  has_many :articles, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :company_name, presence: true, length: { maximum: 30 }
  validates :kana_company_name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 30 }
  validates :postal_code, presence: true, length: { minimum: 7, maximum: 7 }
  validates :address, presence: true, length: { maximum: 30 }
  validates :phone_number, presence: true, length: { maximum: 12 }
  validates :introduction, length: { maximum: 500 }

  attachment :profile_image
  attachment :background_image

  # approvedがtrueであればログイン可。新規登録時点ではdefaultがfalseなのでログインできない状態にする
  def active_for_authentication?
    super && self.approved?
  end

  # 上記でログインが弾かれた後のメッセージ。文言詳細は config/locales/devise.ja.yml に記載。
  def inactive_message
    self.approved? ? super : :needs_admin_approval
  end

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end
end
