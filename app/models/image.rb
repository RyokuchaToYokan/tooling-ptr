class Image < ApplicationRecord

  mount_uploader :picture, ImageUploader

  belongs_to :message, optional: true
  belongs_to :post, optional: true

end
