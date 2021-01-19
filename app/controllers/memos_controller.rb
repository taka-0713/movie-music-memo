class MemosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

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
  end

  def edit
    unless @memo.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    if @memo.update(memo_params)
      redirect_to memo_path(@memo.id)
    else
      render :edit
    end
  end

  def destroy
    if @memo.user_id == current_user.id
       @memo.destroy
       redirect_to root_path
    else
       render :show
    end
  end

  private

  def memo_params
    params.require(:memo).permit(:movie_title, :director, :music, :movie_genre_id, :music_genre_id, :theme_song, :inserted_song, :text, :image).merge(user_id: current_user.id)
  end

  def set_item
    @memo = Memo.find(params[:id])
  end

end
