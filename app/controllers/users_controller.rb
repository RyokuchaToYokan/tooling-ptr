class UsersController < ApplicationController
  before_action :set_user, except: [:new]

  def new
    @user = User.new
    @user.images.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @posts = @user.posts.order("updated_at DESC") 
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
    params.require(:user).permit(:nickname, :email, :bike, :prefecture_id, :image)
  end

  def set_user
    @user = User.find(params[:id])
  end

end