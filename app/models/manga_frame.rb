class MangaFrame < ApplicationRecord
  belongs_to :relay_manga
  belongs_to :user
end
