require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品登録できる' do
      it 'name, image, price, shipping_cost_id, items_status_id, days_to_ship_id, category_id, prefecture_id, imageが存在すれば登録できること' do
        expect(@item).to be_valid
      end

      it 'priceが300-9999999間の数値であれば登録できる' do
        @item.price = '1234567'
        expect(@item).to be_valid
      end

      it 'priceが半角数値であれば登録できる' do
        @item.price = '1234567'
        expect(@item).to be_valid
      end
    end

    context 'ユーザー登録できない' do
      it 'nameが空では登録できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'priceが空では登録できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが価格は半角英数混合では登録できないこと' do
        @item.price = '1a'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number", "Price is not included in the list")
      end

      it '価格は半角英語だけでは登録できないこと' do
        @item.price = 'aa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number", "Price is not included in the list")
      end

      it 'priceが全角数値であれば登録できないこと' do
        @item.price = '８８８'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'priceが300以下であれば登録できないこと' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it 'priceが9999999であれば登録できないこと' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it 'descriptionが空であれば登録できないこと' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'shipping_cost_idが空であれば登録できないこと' do
        @item.shipping_cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
      end

      it 'items_status_idが空であれば登録できないこと' do
        @item.items_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Items status can't be blank")
      end

      it 'days_to_ship_idが空であれば登録できないこと' do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end

      it 'category_idが空であれば登録できないこと' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'prefecture_idが空であれば登録できないこと' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'userテーブルと紐ついていないと登録できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end

      it 'imageが空であれば登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'shipping_cost_idは0だと登録できない。' do
        @item.shipping_cost_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
      end

      it 'items_status_idは0だと登録できない。' do
        @item.items_status_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Items status can't be blank")
      end      
      
      it 'days_to_ship_idは0だと登録できない。' do
        @item.days_to_ship_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end

      it 'category_idは0だと登録できない。' do
        @item.category_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'prefecture_idは0だと登録できない。' do
        @item.prefecture_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
    end
  end
end

