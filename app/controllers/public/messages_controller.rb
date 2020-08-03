class Public::MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    if Room.where(user_id: current_user.id, id: params[:message][:room_id]).present?
      @message = Message.create(params.require(:message).permit(:user_id, :message, :room_id).merge(user_id: current_user.id))
      notification = Notification.new(user_id: current_user.id, room_id: @message.room_id, company_id: @message.room.company_id)
      # 自分のメッセージを自分に通知する必要はないため、通知済みとする
      if notification.user_id == current_user.id
        notification.checked = true
      end
      notification.save if notification.valid?
    else
      flash.now[:alert] = "メッセージ送信に失敗しました。"
    end
    redirect_to "/rooms/#{@message.room_id}"
  end
end