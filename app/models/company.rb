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
  has_many :notifications, dependent: :destroy

  validates :company_name, presence: true
  validates :kana_company_name, presence: true
  validates :email, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true

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
