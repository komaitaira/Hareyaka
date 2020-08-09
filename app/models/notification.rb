class Notification < ApplicationRecord
  belongs_to :room

  # スコープ(新着順)
  default_scope->{order(created_at: :desc)}

  # 通知を送った側の名前を取得
  def sender_name
    if sender_class == "user"
      User.find(sender_id).full_name
    else
      Company.find(sender_id).company_name
    end
  end

  # 通知一覧のイメージ表示。通知を送った側(個人)のデータを取得
  def user
    User.find(sender_id)
  end

  # 通知一覧のイメージ表示。通知を送った側(法人)のデータを取得
  def company
    Company.find(sender_id)
  end
end