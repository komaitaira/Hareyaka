class Public::RoomsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @rooms = current_user.rooms
  end
  
  # 基本的にDMを始めるのは必ず個人会員なので個人会員側のみcreate定義
  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to "/rooms/#{@room.id}"
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  def show
    @room = Room.find(params[:id])
    if Room.where(user_id: current_user.id, company_id: @room.company_id).present?
      # Roomに紐づくnotificationsから通知を受け取った側が個人のデータかつcheckedがfalseのものを取得しtrueに更新
      Notification.where(
        receiver_id: current_user.id,
        receiver_class: "user",
        checked: false
      ).update_all(checked: true)
      @messages = @room.messages.order(updated_at: "ASC")
      @message = Message.new
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def room_params
    params.require(:room).permit(:user_id, :company_id)
  end
end
