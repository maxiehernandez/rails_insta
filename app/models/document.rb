class Document < ApplicationRecord

  def initialize(params = {})
  file = params.delete(:tempfile)
  super
  if file
    self.filename = sanitize_filename(file.original_filename)
    self.content_type = file.content_type
    self.file_contents = file.read
  end
end

private
  def sanitize_filename(filename)
    return File.basename(filename)
  end
end
