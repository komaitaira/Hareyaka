class Notification < ApplicationRecord
  # スコープ(新着順)
  default_scope->{order(created_at: :desc)}
  belongs_to :room

  # 通知を送った側の名前を取得
  def sender_name
    if sender_class == "user"
      User.find(receiver_id).full_name
    else
      Company.find(receiver_id).company_name
    end
  end

  # 通知を受け取った側(個人)のデータを取得
  def user
    User.find(receiver_id)
  end

  # 通知を受け取った側(法人)のデータを取得
  def company
    Company.find(receiver_id)
  end
end