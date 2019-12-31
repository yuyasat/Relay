class CreateRelayMangaGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :relay_manga_genres do |t|
      t.references :relay_manga
      t.references :genre

      t.timestamps
    end
  end
end
