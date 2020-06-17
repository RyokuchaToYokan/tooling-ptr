class UsersController < ApplicationController

  def edit
  end

  def show
    @user = User.find(params[:id])
    rooms = @user.rooms
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
    params.require(:user).permit(:nickname, :email)
  end
end
