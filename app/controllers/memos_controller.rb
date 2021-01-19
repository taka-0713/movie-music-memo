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

  def show
    @memo = Memo.find(params[:id])
  end

  def edit
    @memo = Memo.find(params[:id])
    unless @memo.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    @memo = Memo.find(params[:id])
    if @memo.update(memo_params)
      redirect_to memo_path(@memo.id)
    else
      render :edit
    end
  end

  def destroy
    memo = Memo.find(params[:id])
    memo.destroy
    redirect_to root_path
  end

  private

  def memo_params
    params.require(:memo).permit(:movie_title, :director, :music, :movie_genre_id, :music_genre_id, :theme_song, :inserted_song, :text, :image).merge(user_id: current_user.id)
  end

end
