class Image < ApplicationRecord

  mount_uploader :picture, ImageUploader

  belongs_to :message
  belongs_to :post
  belongs_to :user

end
