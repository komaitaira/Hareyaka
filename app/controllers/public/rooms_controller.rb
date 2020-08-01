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
      @u_messages = @room.user_messages
      @c_messages = @room.company_messages # これらをまとめてcreated_at順に表示することができれば会話のキャッチボール的な表示になるかも
      array = [@u_messages, @c_messages]
      @messages = array.map {|message| message.order(created_at: :desc)} # mapメソッドでやってみたけど@messagesで繰り返し処理するとmessageカラムとかがどっちのもの？というエラーが出る
      @message = UserMessage.new
      @c_entries = @room.company_entries
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
