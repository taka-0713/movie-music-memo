class CreateMemos < ActiveRecord::Migration[6.0]
  def change
    create_table :memos do |t|
      t.references  :user,             foreign_key: true
      t.string      :movie_title,      null: false 
      t.string      :director,         null: false 
      t.string      :music,            null: false 
      t.integer     :movie_genre_id,   null: false
      t.integer     :music_genre_id,   null: false
      t.string      :theme_song
      t.string      :inserted_song
      t.text        :text
      t.timestamps
    end
  end
end
