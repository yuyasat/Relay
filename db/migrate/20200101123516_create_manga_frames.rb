class CreateMangaFrames < ActiveRecord::Migration[6.0]
  def change
    create_table :manga_frames do |t|
      t.references :relay_manga, null: false
      t.references :user, null: false
      t.jsonb :meta_data, null: false

      t.timestamps
    end
  end
end
