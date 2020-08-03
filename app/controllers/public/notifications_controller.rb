class Public::NotificationsController < ApplicationController
  def index
    #Notificationモデルの中で通知を受け取った側のid(receiver_id)と、class(receiver_class)の配列を取得
    @notifications = Notification.where(
      receiver_id: current_user.id,
      receiver_class: "user",
      checked: false
    ).page(params[:page])
  end

  def destroy_all
    #通知を全削除
    @notifications = Notification.where(
      receiver_id: current_user.id,
      receiver_class: "user",
      checked: false
    ).destroy_all
    redirect_to notifications_path
  end
end