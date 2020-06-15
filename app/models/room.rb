class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users
  has_many :chat
  validates :name, presence: true

  attribute :status_id, :integer, default: 1
end
