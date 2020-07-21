class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  def full_name
    last_name + " " + first_name
  end

  def kana_full_name
    kana_last_name + " " + kana_first_name
  end
end
