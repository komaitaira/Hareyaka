class Corporate::RoomsController < ApplicationController
  def index
    @rooms = current_company.rooms
  end
  
  def show
    @room = Room.find(params[:id])
    if Room.where(company_id: current_company.id, user_id: @room.user_id).present?
      # Roomに紐づくnotificationsから通知を受け取った側が法人のデータかつcheckedがfalseのものを取得しtrueに更新
      Notification.where(
        receiver_id: current_company.id,
        receiver_class: "company",
        checked: false
      ).update_all(checked: true)
      @messages = @room.messages.order(updated_at: "ASC")
      @message = Message.new
    else
      redirect_back(fallback_location: root_path)
    end
  end
end