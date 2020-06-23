class Post < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :post_categories
  has_many :categories, through: :post_categories
  
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :category, optional: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :parent_category, :child_category, :category_id, :prefecture_id, length: { minimum: 1, message: 'を選択してください' }
  validates :title, length: { maximum: 35, message: 'は最大で35字までです' }
  validates :content, length: { maximum: 1000, message: 'は最大で1000字までです' }

end
