class Public::NotificationsController < ApplicationController
  def index
    #current_userのmessageに紐づいた通知一覧
    notifications = current_user.passive_notifications.page(params[:page])
    #notificationの中でまだ確認していない(indexに一度も遷移していない)通知のみ探し出しcheckedをtrueに複数同時更新
    notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
    @notifications = notification.where.not(visiter_id: current_user.id)
  end

  def destroy_all
    #通知を全削除
    @notifications = current_user.passive_notifications.destroy_all
    redirect_to notifications_path
  end
end