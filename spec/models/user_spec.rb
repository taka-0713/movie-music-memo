require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it "nicknameが存在すれば登録できる" do
          expect(@user).to be_valid
        end
      end

      context '新規登録がうまくいかないとき' do
        it "nicknameが空だと登録できない" do
          @user.nickname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it "emailが空だと登録できない" do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it "emailに@が含まれていないと登録できない" do
          @user.email = "aaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end
        it "重複したemailは登録できない" do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end
        it "passwordが空だと登録できない" do
          @user.password = nil
          @user.password_confirmation = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank", "Password is invalid")
        end
        it "passwordが存在してもpassword_confirmationが空では登録できない" do
          @user.password_confirmation = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it "passwordが5文字以下であれば登録できない" do
          @user.password = "abcde"
          @user.password_confirmation = "abcde"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)", "Password is invalid")
        end
        it "passwordが半角英字だけでは登録できない" do
          @user.password = "abcdef"
          @user.password_confirmation = "abcdef"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
        it "passwordが半角数字だけでは登録できない" do
          @user.password = 123456
          @user.password_confirmation = 123456
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
      end
    end
  end
end
