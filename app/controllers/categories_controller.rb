class CategoriesController < ApplicationController
  before_action :set_category
  before_action :set_history
  
  def show
    @historys = current_user.rooms.order("created_at DESC")

  end

  private
  
  def set_category
    @category = Category.where(ancestry: nil)
  end

  def set_history
    @historys = current_user.rooms.order("created_at DESC")
  end

end
