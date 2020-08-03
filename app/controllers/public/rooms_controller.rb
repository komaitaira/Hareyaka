class Public::RoomsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @rooms = current_user.rooms
  end
  
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
      @messages = @room.messages.order(updated_at: "ASC")
      # array = [] # 空の配列arrayを用意
      # @room.user_messages.each do |u|
      #   array << u # arrayにuser_messagesを代入
      # end
      # @room.company_messages.each do |c|
      #   array << c # arrayにcompany_messagesを代入
      # end
      # @messages = array.sort{|p,n| p.created_at <=> n.created_at} # 配列arrayの中でcreated_atを比べて並び替えし、@messagesに代入
      @message = Message.new
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def room_params
    params.require(:room).permit(:user_id, :company_id)
  end
end
