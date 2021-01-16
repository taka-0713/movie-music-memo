class Memo < ApplicationRecord

  belongs_to :user

  has_one_attached :image

  with_options extend ActiveHash::Associations::ActiveRecordExtensions do
    belongs_to :movie_genre
    belongs_to :music_genre
  end

end
