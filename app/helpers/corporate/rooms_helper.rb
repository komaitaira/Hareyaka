module Corporate::RoomsHelper
  # 最新メッセージのデータを取得して表示するメソッド
  def most_new_message_preview(room)
    # 最新メッセージのデータを取得する
    message = room.user_messages.order(updated_at: :desc).limit(1)
    # 配列から取り出す
    u_message = message[0]
    # メッセージの有無を判定
    if u_message.present?
      # メッセージがあれば内容を表示
      tag.p "#{u_message.message}"
    else
      # メッセージがなければ[ まだメッセージはありません ]を表示
      tag.p "[ まだメッセージはありません ]"
    end
  end

  # 相手ユーザー名を取得して表示するメソッド
  def opponent_user(room)
    # 中間テーブルから相手ユーザーのデータを取得
    entry = room.company_entries
    # 相手ユーザーの名前を取得
    name = entry[0].user.full_name
    # 名前を表示
    tag.p "#{name}"
  end
end
