class Public::UserMessagesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    if UserEntry.where(user_id: current_user.id, room_id: params[:user_message][:room_id]).present?
      @message = UserMessage.create(params.require(:user_message).permit(:user_id, :message, :room_id).merge(user_id: current_user.id))
    else
      flash.now[:alert] = "メッセージ送信に失敗しました。"
    end
    redirect_to "/rooms/#{@message.room_id}"
  end
end