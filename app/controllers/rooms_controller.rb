class RoomsController < ApplicationController

  def index
    @rooms = Room.all.order("created_at DESC")
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


  def edit
    @room = Room.find(params[:id])
  end


  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to rooms_path, notice: "相談室名を編集しました"
    else
      render :edit
    end
  end


  def destroy
    @room = Room.find(params[:id])
    if @room.destroy
      redirect_to rooms_path, notice: "投稿が削除されました"
    else
      flash.now[:alert] = "投稿の削除に失敗しました"
      render :index
    end
  end
  


  private
  
  def room_params
    params.require(:room).permit(:name)
  end

end
