class CreateRelayMangas < ActiveRecord::Migration[6.0]
  def change
    create_table :relay_mangas do |t|
      t.string :title
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
