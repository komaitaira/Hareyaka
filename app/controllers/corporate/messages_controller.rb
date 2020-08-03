class Corporate::MessagesController < ApplicationController
  before_action :authenticate_company!, only: [:create]

  def create
    if Room.where(company_id: current_company.id, id: params[:message][:room_id]).present?
      @message = Message.create(params.require(:message).permit(:company_id, :message, :room_id).merge(company_id: current_company.id))
      notification = Notification.new(user_id: @message.room.user_id, room_id: @message.room_id, company_id: current_company.id)
      # 自分のメッセージを自分に通知する必要はないため、通知済みとする
      if notification.company_id == current_company.id
        notification.checked = true
      end
      notification.save if notification.valid?
    else
      flash.now[:alert] = "メッセージ送信に失敗しました。"
    end
    redirect_to "/corporate/rooms/#{@message.room_id}"
  end
end