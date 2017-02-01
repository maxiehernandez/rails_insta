class Post < ApplicationRecord
  has_many :comments

  mount_uploader :thumbnail_image, ImageUploader
end
