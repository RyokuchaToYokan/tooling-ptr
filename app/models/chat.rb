class Chat < ApplicationRecord
  belongs_to :room
  belongs_to :uesr

  validates :content, presence: true, unless: :image?

  mount_uploader :image, ImageUploader
end
