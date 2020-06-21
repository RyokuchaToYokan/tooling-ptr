class CategoriesController < ApplicationController
  before_action :set_category
  before_action :set_history
  
  def show
    @child = Category.find(params[:id])
    @grandchildren = @child.children
    @posts = Post.where(category_id: params[:id]).order("created_at DESC")
  end



  private
  
  def set_category
    @category = Category.where(ancestry: nil)
  end

  def set_history
    @historys = current_user.rooms.order("created_at DESC") if user_signed_in?
  end

end
