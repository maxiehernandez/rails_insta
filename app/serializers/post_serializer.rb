class PostSerializer < ActiveModel::Serializer
  attributes :id, :image_url, :name, :caption
  has_many :comments
end
