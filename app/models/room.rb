class Room < ApplicationRecord
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
  has_many :chats, dependent: :destroy

  validates :name, presence: true

  attribute :status_id, :integer, default: 1

  def show_last_chat
    if (last_chat = chats.last).present?
      if last_chat.content?
        last_chat.content
      else
        "画像が投稿されています"
      end
    else
      "まだメッセージはありません"
    end
  end
end
