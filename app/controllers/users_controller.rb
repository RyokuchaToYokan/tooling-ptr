class UsersController < ApplicationController
  before_action :set_category
  before_action :set_history

  def new
    @user = User.new
    @user.images.new
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
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

  def set_category
    @category = Category.where(ancestry: nil)
  end

  def set_history
    @historys = current_user.rooms.order("created_at DESC") if user_signed_in?
  end

end