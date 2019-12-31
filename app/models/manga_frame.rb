class MangaFrame < ApplicationRecord
  include FileUploader::Attachment(:meta)
  belongs_to :relay_manga
  belongs_to :user
end
