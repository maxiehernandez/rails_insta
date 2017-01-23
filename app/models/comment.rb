class Comment < ApplicationRecord::Base
  belongs_to :post
end
