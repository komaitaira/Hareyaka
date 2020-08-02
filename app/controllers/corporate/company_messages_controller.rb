class Corporate::CompanyMessagesController < ApplicationController
  before_action :authenticate_company!, only: [:create]

  def create
    if CompanyEntry.where(company_id: current_company.id, room_id: params[:company_message][:room_id]).present?
      @message = CompanyMessage.create(params.require(:company_message).permit(:company_id, :message, :room_id).merge(company_id: current_company.id))
      @message.c_create_notification_message(current_company, company_message_id, company_id)
    else
      flash.now[:alert] = "メッセージ送信に失敗しました。"
    end
    redirect_to "/corporate/rooms/#{@message.room_id}"
  end
end