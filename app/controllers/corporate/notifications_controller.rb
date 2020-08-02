class Corporate::NotificationsController < ApplicationController
  def index
    #current_companyのmessageに紐づいた通知一覧
    notifications = current_company.passive_notifications.page(params[:page])
    #notificationの中でまだ確認していない(indexに一度も遷移していない)通知のみ探し出しcheckedをtrueに複数同時更新
    notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
    @notifications = notifications.where.not(visiter_id: current_company.id)
  end

  def destroy_all
    #通知を全削除
    @notifications = current_company.passive_notifications.destroy_all
    redirect_to corporate_notifications_path
  end
end