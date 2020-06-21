class Post < ApplicationRecord
  belongs_to :user
  has_many :images
  has_many :post_categories
  has_many :categories, through: :post_categories
  
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :category, optional: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
