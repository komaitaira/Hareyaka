class Public::MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    if Room.where(user_id: current_user.id, id: params[:message][:room_id]).present?
      @message = Message.create(
        params.require(:message).permit(:user_id, :message, :room_id)
        .merge(user_id: current_user.id)
      )
      # Messageがcreateされた直後にNotificationモデルのインスタンス作成。通知を送る側(個人)、通知を受け取る側(法人)
      if @message.errors.empty?
        notification = Notification.new(
          sender_id: current_user.id, 
          sender_class: "user", 
          receiver_id: @message.room.company_id, 
          receiver_class: "company", 
          room_id: @message.room_id
        )
        notification.save if notification.valid?
      end
    else
      flash.now[:alert] = "メッセージ送信に失敗しました。"
    end
    redirect_to "/rooms/#{@message.room_id}"
  end
end