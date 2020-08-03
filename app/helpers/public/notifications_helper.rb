module Public::NotificationsHelper
  def user_unchecked_notifications
    @notifications = Notification.where(
      receiver_id: current_user.id,
      receiver_class: "user",
      checked: false
    )
  end
end