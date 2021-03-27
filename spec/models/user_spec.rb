require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    context 'ユーザー登録できる' do
      it 'name,email,nickname,first_name,last_name, first_name_reading, last_name_reading, birthday, passwordとpassword_confirmationが存在すれば登録できること' do
        expect(@user).to be_valid
      end

      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = "1234567"
        @user.password_confirmation = "1234567"
        expect(@user).to be_valid
      end

    end
  
      context 'ユーザー登録できない' do
      it 'nicknameが空では登録できないこと' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      
      it 'emailが空では登録できないこと' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
  
      it 'passwordが空では登録できないこと' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
  
      end
      it 'first_nameが空では登録できないこと' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
  
      end
      it 'last_nameが空では登録できないこと' do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_name_readingが空では登録できないこと' do
        @user.first_name_reading = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading can't be blank")
      end
      it 'last_name_readingが空では登録できないこと' do
        @user.last_name_reading = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading can't be blank")
      end
      it 'birthdayが空では登録できないこと' do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'first_nameがローマ字では登録できない' do
        @user.first_name = "abc"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters.")
      end

      it 'last_nameがローマ字では登録できない' do
        @user.last_name = "abc"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name Full-width characters.")
      end

      it 'first_name_readingが漢字では登録できない' do
        @user.first_name_reading = "田中"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading Full-width katakana characters")
      end

      it 'last_name_readingが漢字では登録できない' do
        @user.last_name_reading = "田中"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading Full-width katakana characters")
      end

      it 'first_name_readingがひらがなでは登録できない' do
        @user.first_name_reading = "たなか"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading Full-width katakana characters")
      end

      it 'first_name_readingがひらがなでは登録できない' do
        @user.last_name_reading = "たなか"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading Full-width katakana characters")
      end

    end
  end  
end
