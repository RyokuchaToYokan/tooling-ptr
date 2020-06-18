class PostsController < ApplicationController
  before_action :set_parent_categories, only: [:new, :create, :edit, :update]


  def new
    @post = Post.new
    @historys = current_user.rooms.order("created_at DESC")

  end

  def create
    Post.create(post_params)
    params[:post][:category_id] = "" if params[:parent_category].blank? || params[:child_category].blank?

    if @post.save
      redirect_to root_path
    else
      # @post.images.build
      @parent_category = params[:parent_category] if params[:parent_category].present?
      @child_category = params[:child_category] if params[:child_category].present?
      @grandchild_category = params[:post][:category_id] if params[:post][:category_id].present?
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :prefecture_id, :category_id).merge(user_id: current_user.id)
  end

  def set_parent_categories
    @parent_categories = Category.where(ancestry: nil)
  end
  
end