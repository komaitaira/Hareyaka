class Corporate::RoomsController < ApplicationController
  def index
    currentCompanyEntries = current_company.company_entries
    myRoomIds = []
    currentCompanyEntries.each do |cc|
      myRoomIds << cc.room.id
    end
    @rooms = UserEntry.where(room_id: myRoomIds)
  end
  
  def show
    @room = Room.find(params[:id])
    if CompanyEntry.where(company_id: current_company.id, room_id: @room.id).present?
      array = [] # 空の配列arrayを用意
      @room.user_messages.each do |u|
        array << u # arrayにuser_messagesを代入
      end
      @room.company_messages.each do |c|
        array << c # arrayにcompany_messagesを代入
      end
      @messages = array.sort{|p,n| p.created_at <=> n.created_at} # 配列arrayの中でcreated_atを比べて並び替えし、@messagesに代入
      @message = CompanyMessage.new
      @u_entries = @room.user_entries
    else
      redirect_back(fallback_location: root_path)
    end
  end
end