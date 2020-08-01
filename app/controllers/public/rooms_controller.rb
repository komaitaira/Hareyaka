class Public::RoomsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @room = Room.create
    @cu_entry = UserEntry.create(room_id: @room.id, user_id: current_user.id)
    @c_entry = CompanyEntry.create(params.require(:company_entry).permit(:company_id, :room_id).merge(room_id: @room.id)) # @company = Comapny.find(params[:id])でも取れそう
    redirect_to "/rooms/#{@room.id}"
  end
  
  def show
    @room = Room.find(params[:id])
    if UserEntry.where(user_id: current_user.id, room_id: @room.id).present?
      array = [] # 空の配列arrayを用意
      @room.user_messages.each do |u|
        array << u # arrayにuser_messagesを代入
      end
      @room.company_messages.each do |c|
        array << c # arrayにcompany_messagesを代入
      end
      @messages = array.sort{|p,n| p.created_at <=> n.created_at} # 配列arrayの中でcreated_atを比べて並び替えし、@messagesに代入
      @message = UserMessage.new
      @c_entries = @room.company_entries
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
