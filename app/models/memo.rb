class Memo < ApplicationRecord

  with_options presence: true do
    validates :user_id
    validates :movie_title
    validates :director
    validates :music  
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates :movie_genre_id 
    validates :music_genre_id
  end

  belongs_to :user
  has_one_attached :image

  with_options extend ActiveHash::Associations::ActiveRecordExtensions do
    belongs_to :movie_genre
    belongs_to :music_genre
  end

  def self.search(search)
    if search != ""
      Memo.where('movie_title like(?) or director like(?) or music like(?)', "%#{search}%", "%#{search}%", "%#{search}%")
    else
      @memos = Memo.includes(:user).order("created_at DESC")
    end
  end

end
