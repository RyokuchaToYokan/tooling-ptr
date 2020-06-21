class TopsController < ApplicationController
# 削除ではgem data-confirm-modalを使用すること
  before_action :set_category
  before_action :set_history


  def index
  end

  def show
    @parent = Category.find(params[:id])
    @children = @parent.children
    @posts = Post.where(category_id: params[:id])
  end



  private

  def set_category
    @category = Category.where(ancestry: nil)
  end

  def set_history
    @historys = current_user.rooms.order("created_at DESC") if user_signed_in?
  end

end
