class CategoriesController < ApplicationController
  before_action :set_category
  before_action :set_history
  
  def show
    @grandchild = Category.find(params[:id])
    @grandchildren = @grandchild.children
    @child = @grandchild.parent
    @parent = @child.parent
    @posts = Post.where(category_id: params[:id]).order("created_at DESC")
    
    add_breadcrumb @parent.name, "/tops/#{@parent.id}"
    add_breadcrumb @child.name, "/tops/#{@parent.id}##{@child.id}"
    add_breadcrumb @grandchild.name
  end



  private
  
  def set_category
    @category = Category.where(ancestry: nil)
  end

  def set_history
    @historys = current_user.rooms.order("created_at DESC") if user_signed_in?
  end

end
