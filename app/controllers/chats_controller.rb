class ChatsController < ApplicationController
  before_action :set_room

  def index
    @chat = Chat.new
    @chats = @room.chats.includes(:user)
  end

  def create
    @chat = @room.chats.new(chat_params)
    if @chat.save
      respond_to do |format|
        format.json
      end
    else
      @chats = @room.chats.includes(:user)
      flash.now[:alert] = "メッセージを入力してください"
      render :index
    end
  end


  
  private

  def chat_params
    params.require(:chat).permit(:content, :image).merge(user_id: current_user.id)
  end

  def set_room
    @room = Room.find(params[:room_id])
  end

end
