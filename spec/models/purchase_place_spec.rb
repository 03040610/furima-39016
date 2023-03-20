require 'rails_helper'

RSpec.describe PurchasePlace, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase = FactoryBot.build(:purchase_place, user_id: user.id, item_id: item.id)
      sleep(0.1)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase).to be_valid
      end
      it 'buiding_nameは空でも保存できること' do
        @purchase.building_name = ''
        expect(@purchase).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @purchase.post_code = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase.post_code = '1234567'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Post code is invalid')
      end
      it 'post_codeは半角文字列のみ保存できる' do
        @purchase.post_code = 'こんにちは'
        @purchase.post_code = @purchase.post_code
        @purchase.valid?
       expect(@purchase.errors.full_messages).to include("Post code is invalid")
      end
      it 'post_codeが半角のハイフンを含んだ8桁の文字列でないと保存できないこと' do
        @purchase.post_code = '123-45678'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Post code is invalid')
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @purchase.prefecture_id = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idのid 1は保存できないこと' do
        @purchase.prefecture_id = 1
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Prefecture must be greater than 1")
      end
      it 'cityが空だと保存できないこと' do
        @purchase.city = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @purchase.address = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Address can't be blank")
      end
      it 'tokenが空だと保存できないこと' do
        @purchase.token = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空だと保存できないこと' do
        @purchase.user_id = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できないこと' do
        @purchase.item_id = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Item can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @purchase.item_id = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Item can't be blank")
      end
      it 'phone_numberが10桁以下では登録できない' do
        @purchase.phone_number = Faker::Number.between(from: 0, to: 999999999)
        @purchase.phone_number = @purchase.phone_number
        @purchase.valid?
       expect(@purchase.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
      end
      it 'phone_numberが11桁以上では登録できない' do
        @purchase.phone_number = Faker::Number.between(from: 00000000000, to: 99999999999999999999)
        @purchase.phone_number = @purchase.phone_number
        @purchase.valid?
       expect(@purchase.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it 'phone_numberは半角数字のみ保存できる' do
        @purchase.phone_number = '０８０１０３９５９５５'
        @purchase.phone_number = @purchase.post_code
        @purchase.valid?
       expect(@purchase.errors.full_messages).to include("Phone number is not a number")
      end
    end
  end
end
