class Corporate::RoomsController < ApplicationController
  def index
    @rooms = current_company.rooms
    # myRoomIds = []
    # currentCompanyEntries.each do |cc|
    #   myRoomIds << cc.room.id
    # end
    # @rooms = UserEntry.where(room_id: myRoomIds)
  end
  
  def show
    @room = Room.find(params[:id])
    if Room.where(company_id: current_company.id, user_id: @room.user_id).present?
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
end