class UsersController < ApplicationController

  def new
    @user = User.new
    @user.images.new
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
    @historys = current_user.rooms.order("created_at DESC")
    @posts = current_user.posts.order("created_at DESC")
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :bike, :prefecture_id, images_attributes: [:picture])
  end
end
