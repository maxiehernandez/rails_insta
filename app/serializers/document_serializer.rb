class DocumentSerializer < ActiveModel::Serializer
  # attributes :id, :filename, :content_type, :file_contents
  attributes(Document.attribute_names.map(&:to_sym))

end
