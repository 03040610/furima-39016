require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nick_nameが空では登録できない' do
      @user.nick_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nick name can't be blank")
    end

    it 'emailがで空は登録できない' do
      @user.email= ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '重複したemailが存在する場合は登録できない' do
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user .valid?
      expect(another_user.errors.full_messages).to include('Password is invalid')
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordとpassword(確認)は値の一致が必須' do
      @user.password = 'aiu123'
      @user.password_confirmation = 'aiu1234'
      @user.valid?
      expect(@user.errors.full_messages).to include( "Password confirmation doesn't match Password") 
    end
    it 'passwordは半角英数字混合での入力が必須' do
      @user.password = 'aiueo'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordは6文字以上の入力が必須' do
      @user.password = 'ai000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが129文字以上では登録できない' do
      @user.password = Faker::Internet.password(min_length: 129)
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
    end

    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須' do
      @user.first_name = 'ai'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須' do
      @user.last_name = 'ai'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it ' お名前(全角)は、名字と名前がそれぞれ必須' do
      @user.first_name = ''
      @user.last_name = 'あい'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'first_kana_nameが空では登録できない' do
      @user.first_kana_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First kana name can't be blank")
    end
    it 'お名前カナ(全角)は、名字と名前がそれぞれ必須' do
      @user.first_kana_name = 'ai'
      @user.valid?
      expect(@user.errors.full_messages).to include("First kana name is invalid")
    end

    it 'last_kana_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'お名前カナ(全角)は、名字と名前がそれぞれ必須' do
      @user.last_kana_name = 'ai'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last kana name is invalid")
    end

    it 'birth_dayが空では登録できない' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end