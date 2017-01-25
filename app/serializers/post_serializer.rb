class PostSerializer < ActiveModel::Serializer
  attributes(Post.attribute_names.map(&:to_sym))
  # :id, :image_url, :name, :caption
  has_many :comments, :key=>"comments"
end
