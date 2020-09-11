class Corporate::MessagesController < ApplicationController
  before_action :authenticate_company!

  def create
    if Room.where(company_id: current_company.id, id: params[:message][:room_id]).present?
      @message = Message.create(
        params.require(:message).permit(:company_id, :message, :room_id)
        .merge(company_id: current_company.id)
      )
      # Messageがcreateされた直後にNotificationモデルのインスタンス作成。通知を送る側(法人)、通知を受け取る側(個人)
      if @message.errors.empty?
        notification = Notification.new(
          sender_id: current_company.id,
          sender_class: "company",
          receiver_id: @message.room.user_id,
          receiver_class: "user",
          room_id: @message.room_id
        )
        notification.save if notification.valid?
      end
    else
      flash.now[:alert] = "メッセージ送信に失敗しました。"
    end
    redirect_to "/corporate/rooms/#{@message.room_id}"
  end
end