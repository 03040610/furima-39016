require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品できるとき' do
      it '全てのカラムが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end 
    context '出品できないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'item_columnがで空は登録できない' do
        @item.item_column= ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item column can't be blank")
      end

      it 'item_priceが空では登録できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end
      it 'item_priceが300円以下では登録できない' do
        @item.item_price = Faker::Number.between(from: 0, to: 299)
        @item.item_price = @item.item_price
        @item.valid?
       expect(@item.errors.full_messages).to include("Item price must be greater than or equal to 300")
      end
      it 'item_priceが9999999円以下では登録できない' do
        @item.item_price = Faker::Number.between(from: 9999999, to: 9999999999999999999999999999999)
        @item.item_price = @item.item_price
        @item.valid?
       expect(@item.errors.full_messages).to include("Item price must be less than or equal to 9999999")
      end

      it 'item_priceは半角数字のみ保存できる' do
        @item.item_price = 'hello'
        @item.item_price = @item.item_price
        @item.valid?
       expect(@item.errors.full_messages).to include("Item price must be greater than or equal to 300")
      end
  
      it 'item_category_idが空では登録できない' do
        @item.item_category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end
      
      it 'item_category_idのidが1では登録できない' do
        @item.item_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category must be greater than 1")
      end

      it 'item_status_idが空では登録できない' do
        @item.item_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank")
      end

      it 'item_status_idのidが1では登録できない' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status must be greater than 1")
      end

      it 'delivery_charge_idが空では登録できない' do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      
      it 'delivery_charge_idのidが1では登録できない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge must be greater than 1")
      end

      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idのidが1では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be greater than 1")
      end
      
      it 'item_date_id が空では登録できない' do
        @item.item_date_id  = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item date can't be blank")
      end

      it 'item_date_idのidが1では登録できない' do
        @item.item_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item date must be greater than 1")
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end

