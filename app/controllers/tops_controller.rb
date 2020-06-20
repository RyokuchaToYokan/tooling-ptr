class TopsController < ApplicationController
# 削除ではgem data-confirm-modalを使用すること

  def index
    @category = Category.where(ancestry: nil)
  end

  def show
    @category = Category.where(ancestry: nil)
    @parent = Category.find(params[:id])
    @children = @parent.children

    @historys = current_user.rooms.order("created_at DESC") if user_signed_in?
  end

end
