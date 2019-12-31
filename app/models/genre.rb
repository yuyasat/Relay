class Genre < ApplicationRecord
  has_many :relay_manga_genres
  has_many :relay_mangas, through: :relay_manga_genres
end
