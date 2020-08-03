class Message < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :company, optional: true
  belongs_to :room
  # has_many :notifications, dependent: :destroy
  validates :message, presence: true

  # def u_create_notification_message(current_user, user_message_id, visited_id)
  #   notification = current_user.active_notifications.new(
  #     room_id: room_id,
  #     user_message_id: user_message_id,
  #     visited_id: visited_id,
  #     action: "message"
  #   )
  #   # 自分のメッセージを自分に通知する必要はないため、自分のRoomに対するメッセージの場合は、通知済みとする
  #   if notification.visiter_id == notification.visited_id
  #     notification.checked = true
  #   end
  #   notification.save if notification.valid?
  # end
end
