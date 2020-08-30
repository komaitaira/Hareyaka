class Admin::NotificationsController < ApplicationController
  def index
    #current_adminが受け取った通知一覧
    @notifications = Notification.where(
      receiver_id: current_admin.id,
      receiver_class: "admin",
      checked: false
    )
  end

  def destroy_all
    #通知を全削除
    Notification.where(
      receiver_id: current_admin.id,
      receiver_class: "admin",
      checked: false
    ).destroy_all
    redirect_to admin_notifications_path
  end
end