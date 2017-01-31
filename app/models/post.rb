class Post < ApplicationRecord
  has_many :comments
  include ImageUploader[:image]
end
