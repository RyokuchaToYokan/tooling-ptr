class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_user!     #ログイン必須機能
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_category
  before_action :set_history



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :image])
  end

  def set_category
    @category = Category.where(ancestry: nil)
  end

  def set_history
    @historys = current_user.rooms.order("created_at DESC") if user_signed_in?
  end
  
end
