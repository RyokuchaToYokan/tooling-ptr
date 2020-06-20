class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :chats
  has_many :posts
  has_many :images
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :nickname, presence: true, uniqueness: true

  accepts_nested_attributes_for :images, allow_destroy: true
  attribute :prefecture_id, :integer, default: 48
  
end
