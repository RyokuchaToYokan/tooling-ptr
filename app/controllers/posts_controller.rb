class PostsController < ApplicationController
  before_action :set_parent_categories, only: [:new, :create, :edit, :update]
  before_action :set_category
  before_action :set_history

  def new
    @post = Post.new
    @post.images.new
  end

  def create
    params[:post][:category_id] = "" if params[:parent_category].blank? || params[:child_category].blank?
    @post = Post.new(post_params)

    if @post.save
      redirect_to root_path, notice: "投稿しました"
    else
      # @post.images.build
      @parent_category = params[:parent_category] if params[:parent_category].present?
      @child_category = params[:child_category] if params[:child_category].present?
      @grandchild_category = params[:post][:category_id] if params[:post][:category_id].present?
      render :new
    end
  end

  def get_child_categories
    parent_category = Category.find(params[:id])
    @child_categories = parent_category.children
  end

  def get_grandchild_categories
    child_category = Category.find(params[:id])
    @grandchild_categories = child_category.children
  end



  private
  
  def post_params
    params.require(:post).permit(:title, :content, :prefecture_id, :category_id).merge(user_id: current_user.id, parent_category: params[:parent_category], child_category: params[:child_category])
  end

  def set_parent_categories
    @parent_categories = Category.where(ancestry: nil)
  end

  def set_category
    @category = Category.where(ancestry: nil)
  end

  def set_history
    @historys = current_user.rooms.order("created_at DESC") if user_signed_in?
  end
  
end