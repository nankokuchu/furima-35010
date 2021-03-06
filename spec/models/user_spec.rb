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
        @user.password = '1234567a'
        @user.password_confirmation = '1234567a'
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録できない' do
      it 'nicknameが空では登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailに＠が含まれていないと登録できないこと' do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'emailが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが半角数字だけでは登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end

      it 'passwordが半角英字だけでは登録できないこと' do
        @user.password = 'testtest'
        @user.password_confirmation = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end

      it 'passwordが全角だと登録できないこと' do
        @user.password = '123456あ'
        @user.password_confirmation = '123456あ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end

      it 'passwordが５文字以下では登録できないこと' do
        @user.password = 'test1'
        @user.password_confirmation = 'test1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'first_nameが空では登録できないこと' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_nameが空では登録できないこと' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_name_readingが空では登録できないこと' do
        @user.first_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading can't be blank")
      end
      it 'last_name_readingが空では登録できないこと' do
        @user.last_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading can't be blank")
      end
      it 'birthdayが空では登録できないこと' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'first_nameがローマ字では登録できない' do
        @user.first_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name Full-width characters.')
      end

      it 'last_nameがローマ字では登録できない' do
        @user.last_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name Full-width characters.')
      end

      it 'first_name_readingが漢字では登録できない' do
        @user.first_name_reading = '田中'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name reading Full-width katakana characters')
      end

      it 'last_name_readingが漢字では登録できない' do
        @user.last_name_reading = '田中'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name reading Full-width katakana characters')
      end

      it 'first_name_readingがひらがなでは登録できない' do
        @user.first_name_reading = 'たなか'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name reading Full-width katakana characters')
      end

      it 'first_name_readingがひらがなでは登録できない' do
        @user.last_name_reading = 'たなか'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name reading Full-width katakana characters')
      end
    end
  end
end
