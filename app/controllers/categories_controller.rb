class CategoriesController < ApplicationController
  
  def show
    @grandchild = Category.find(params[:id])
    @child = @grandchild.parent
    @parent = @child.parent
    @posts = Post.where(category_id: params[:id]).order("updated_at DESC")
    
    add_breadcrumb @parent.name, "/tops/#{@parent.id}"
    add_breadcrumb @child.name, "/tops/#{@parent.id}##{@child.id}"
    add_breadcrumb @grandchild.name
  end


  private
  
end
