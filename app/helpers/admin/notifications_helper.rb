module Admin::NotificationsHelper
  # adminが未確認の通知一覧
  def admin_unchecked_notifications
    @notifications = Notification.where(
      receiver_id: current_admin.id,
      receiver_class: "admin",
      checked: false
    )
  end
end