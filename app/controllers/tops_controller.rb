class TopsController < ApplicationController
# 追加機能として削除ではgem data-confirm-modalを使用すること

  def index
  end

  def show
    @parent = Category.find(params[:id])
    @children = @parent.children
    @posts = Post.where(category_id: params[:id])
  end


  private

end
