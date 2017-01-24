class CommentSerializer < ActiveModel::Serializer
  attributes (Comment.attribute_names.map(&:to_sym))
  # :id, :body, :post_id
  belongs_to :post, :key=>"post"
end
