class MemosController < ApplicationController

  def index
    @memo = Memo.includes(:user).order("created_at DESC")
  end

  def new
    @memo = Memo.new
  end

  def create
    @memo = Memo.new(memo_params)
    if @memo.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def memo_params
    params.require(:memo).permit(:movie_title, :director, :music, :movie_genre_id, :music_genre_id, :theme_song, :inserted_song, :text, :image).merge(user_id: current_user.id)
  end

end
