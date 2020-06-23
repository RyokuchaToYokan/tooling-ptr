class PostsController < ApplicationController
  before_action :set_parent_categories, only: [:new, :create, :edit, :update]
  protect_from_forgery :except => [:destroy]
  before_action :redirect_to_roo_path, except: [:show, :search]

  def new
    @post = Post.new
    @post.images.new
  end


  def create
    params[:post][:category_id] = "" if params[:parent_category].blank? || params[:child_category].blank?
    @post = Post.new(post_params)

    if @post.save
      redirect_to user_path(@post.user), notice: "投稿しました"
    else
      # @post.images.build
      @parent_category = params[:parent_category] if params[:parent_category].present?
      @child_category = params[:child_category] if params[:child_category].present?
      @grandchild_category = params[:post][:category_id] if params[:post][:category_id].present?
      render :new
    end
  end


  def show
    @post = Post.find(params[:id])
    # @user = @post.user_id
    @grandchild = @post.category
    @child = @grandchild.parent
    @parent = @child.parent

    add_breadcrumb @parent.name, "/tops/#{@parent.id}"
    add_breadcrumb @child.name, "/tops/#{@parent.id}##{@child.id}"
    add_breadcrumb @grandchild.name, "/categories/#{@grandchild.id}"
  end


  def edit
    @post = Post.find(params[:id])
    # @user = @post.user_id
    @child_category = @post.category.parent
    @parent_category = @child_category.parent
  end


  def update
    params[:post][:category_id] = "" if params[:parent_category].blank? || params[:child_category].blank?
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to user_path(@post.user), notice: "投稿を編集しました"
    else
      # @post.images.build
      @parent_category = params[:parent_category] if params[:parent_category].present?
      @child_category = params[:child_category] if params[:child_category].present?
      @grandchild_category = params[:post][:category_id] if params[:post][:category_id].present?
      render :edit
    end
  end


  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to user_path(@post.user), notice: "投稿が削除されました"
    else
      flash.now[:alert] = "投稿の削除に失敗しました"
      render :show
    end
  end

  
  def search
    @posts = Post.search(params[:keyword])
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
  
end