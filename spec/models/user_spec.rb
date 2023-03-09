require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'emailが空では登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.email = ''  # nicknameの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include "Email can't be blank"
    end

    it ''
  end
end