class RoomsController < ApplicationController

  def index
    # binding.pry
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
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
