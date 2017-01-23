class Post < ApplicationRecord::Base
  has_many :comments
end
