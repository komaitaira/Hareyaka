class Corporate::NotificationsController < ApplicationController
  before_action :authenticate_company!
  
  def index
    #Notificationモデルの中で通知を受け取った側のid(receiver_id)と、class(receiver_class)の配列を取得
    @notifications = Notification.where(
      receiver_id: current_company.id,
      receiver_class: "company",
      checked: false
    ).page(params[:page])
  end

  def destroy_all
    #通知を全削除
    Notification.where(
      receiver_id: current_company.id,
      receiver_class: "company",
      checked: false
    ).destroy_all
    redirect_to corporate_notifications_path
  end
end