module ApplicationHelper
  # DM一覧で最新のメッセージを表示
  def most_new_message(room)
    messages = room.messages.order(updated_at: :desc).limit(1)
    m = messages[0]
    if m.present?
      tag.p "#{m.updated_at.strftime("%Y-%m-%d %H:%M ")} #{m.message}"
    else
      tag.p "[ まだメッセージはありません ]"
    end
  end
end
