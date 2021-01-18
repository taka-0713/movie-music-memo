require 'rails_helper'

RSpec.describe Memo, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user)
      @memo = FactoryBot.build(:memo, user_id: @user.id)
    end
    
    describe '新規メモ投稿' do
      context '新規メモ投稿がうまくいくとき' do
        it "movie_titleが存在すれば登録できる" do
          expect(@memo).to be_valid
        end
        it "theme_songが空でも登録できる" do
          @memo.theme_song = nil
          expect(@memo).to be_valid
        end
        it "inserted_songが空でも登録できる" do
          @memo.inserted_song = nil
          expect(@memo).to be_valid
        end
        it "textが空でも登録できる" do
          @memo.text = nil
          expect(@memo).to be_valid
        end
      end

      context '新規メモ投稿がうまくいかないとき' do
        it "user_idが空だと登録できない" do
          @memo.user_id = nil
          @memo.valid?
          expect(@memo.errors.full_messages).to include("User can't be blank", "User must exist")
        end
        it "movie_titleが空だと登録できない" do
          @memo.movie_title = nil
          @memo.valid?
          expect(@memo.errors.full_messages).to include("Movie title can't be blank")
        end
        it "directorが空だと登録できない" do
          @memo.director = nil
          @memo.valid?
          expect(@memo.errors.full_messages).to include("Director can't be blank")
        end
        it "musicが空だと登録できない" do
          @memo.music = nil
          @memo.valid?
          expect(@memo.errors.full_messages).to include("Music can't be blank")
        end
        it "movie_genre_idが空だと登録できない" do
          @memo.movie_genre_id = nil
          @memo.valid?
          expect(@memo.errors.full_messages).to include("Movie genre can't be blank", "Movie genre is not a number")
        end
        it "movie_genre_idが1だと登録できない" do
          @memo.movie_genre_id = [1]
          @memo.valid?
          expect(@memo.errors.full_messages).to include("Movie genre can't be blank", "Movie genre is not a number")
        end
        it "music_genre_idが空だと登録できない" do
          @memo.music_genre_id = nil
          @memo.valid?
          expect(@memo.errors.full_messages).to include("Music genre can't be blank", "Music genre is not a number")
        end
        it "music_genre_idが1だと登録できない" do
          @memo.music_genre_id = [1]
          @memo.valid?
          expect(@memo.errors.full_messages).to include("Music genre can't be blank", "Music genre is not a number")
        end
      end
    end
  end
end
