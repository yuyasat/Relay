require 'csv'

class RelayManga < ApplicationRecord
  has_many :relay_manga_genres
  has_many :genres, through: :relay_manga_genres
  has_many :manga_frames

  enum status: {
    draft: 1,
    released: 2,
  }, _prefix: true

  # csv_path = Rails.root.join('lib/assets/relay_manga_list.csv')
  def self.import_from_csv(csv_path)
    csv = CSV.table(csv_path)[1..-1].map(&:to_hash).map(&:with_indifferent_access)
    csv.select { |c| c.except('id').values.all?(&:present?) }.each do |row|
      relay_manga = self.find_or_initialize_by(id: row[:id]) do |manga|
        manga.title = row[:title]
      end
      relay_manga.relay_manga_genres.destroy_all
      genre1 = Genre.find_or_initialize_by(name: row[:genre1])
      genre2 = Genre.find_or_initialize_by(name: row[:genre2])
      [genre1, genre2].each do |genre|
        relay_manga.genres << genre
      end
      relay_manga.save!
    end
  end
end
