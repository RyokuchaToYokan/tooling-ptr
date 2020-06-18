class RoomsController < ApplicationController

  def index
    @rooms = Room.all
    @historys = current_user.rooms.order("created_at DESC")
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user_ids = current_user.id
    if @room.save
      redirect_to rooms_path, notice: "相談室を作成しました"
    else
      render :new
    end
  end
  

  private
  def room_params
    params.require(:room).permit(:name)
  end

end
