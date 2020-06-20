class CategoriesController < ApplicationController
  def index
    # @bike = Category.find(1)
    # @child = @bike.children
    @historys = current_user.rooms.order("created_at DESC")
  end

  def show
  #   @parent = BikeBord.find(params[:id])
  #   @children = @parent.children
  end
end
