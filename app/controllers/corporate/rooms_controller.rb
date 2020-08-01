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
      @u_messages = @room.user_messages
      @c_messages = @room.company_messages # これらをまとめてcreated_at順に表示することができれば会話のキャッチボール的な表示になるかも
      @message = CompanyMessage.new
      @u_entries = @room.user_entries
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
