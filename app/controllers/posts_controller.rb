class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :prefecture_id, :category_id).merge(user_id: current_user.id)
  end
  
end