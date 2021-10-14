require 'rails_helper'

RSpec.describe BuyItemGetUser, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buy_item_get_user = FactoryBot.build(:buy_item_get_user, user_id: user.id, item_id: item.id) 
    sleep 0.1
  end

  describe "全ての項目が入力されていれば登録できる" do
    context '購入することができるとき' do
      it 'postal_code,delivery_address_id,address_city,address_number,telephone_number,address_building,token,user,itemが入力できているとき' do
        expect(@buy_item_get_user).to be_valid
      end

    it 'address_buildingは空でも保存できること' do
      @buy_item_get_user.address_building = ''
      expect(@buy_item_get_user).to be_valid
    end

   end

    context '購入できないとき' do
      describe "購入者新規登録" do
       it 'postal_codeが空では登録できない' do
        @buy_item_get_user.postal_code = ''
        @buy_item_get_user.valid?
        expect(@buy_item_get_user.errors.full_messages).to include("郵便番号を入力してください")   
       end
      
       it 'postal_codeハイフンなしでは登録できない' do
        @buy_item_get_user.postal_code = '1234567'
        @buy_item_get_user.valid?
        expect(@buy_item_get_user.errors.full_messages).to include("郵便番号にはーをつけてください")   
       end

       it 'delivery_address_idが空では登録できない' do
        @buy_item_get_user.delivery_address_id = ''
        @buy_item_get_user.valid?
        expect(@buy_item_get_user.errors.full_messages).to include("都道府県を入力してください")   
      end
      it 'delivery_address_idが0では登録できない' do
        @buy_item_get_user.delivery_address_id = '0'
        @buy_item_get_user.valid?
        expect(@buy_item_get_user.errors.full_messages).to include("都道府県を選んでください")   
      end

      it 'address_cityが空では登録できない' do
        @buy_item_get_user.address_city = ''
        @buy_item_get_user.valid?
        expect(@buy_item_get_user.errors.full_messages).to include("市区町村を入力してください")   
      end

      it 'address_numberが空では登録できない' do
        @buy_item_get_user.address_number = ''
        @buy_item_get_user.valid?
        expect(@buy_item_get_user.errors.full_messages).to include("番地を入力してください")   
      end

      it 'telephone_numberが空では登録できない' do
        @buy_item_get_user.telephone_number = ''
        @buy_item_get_user.valid?
        expect(@buy_item_get_user.errors.full_messages).to include("電話番号を入力してください")   
      end
      it 'telephone_numberが9桁以下の数値では登録できない' do
        @buy_item_get_user.telephone_number = '123456789'
        @buy_item_get_user.valid?
        expect(@buy_item_get_user.errors.full_messages).to include("電話番号は10文字以上で入力してください")   
      end
      it 'telephone_numberが12桁以上の数値では登録できない' do
        @buy_item_get_user.telephone_number = '1234567891011'
        @buy_item_get_user.valid?
        expect(@buy_item_get_user.errors.full_messages).to include("電話番号は11文字以内で入力してください")   
      end
      it 'telephone_numberが全角数字では登録できない' do
        @buy_item_get_user.telephone_number = '１２３４'
        @buy_item_get_user.valid?
        expect(@buy_item_get_user.errors.full_messages).to include("電話番号電話番号は、10桁以上11桁以内の半角数値のみ保存可能")   
      end

      it 'tokenが空では登録できない' do
        @buy_item_get_user.token = ''
        @buy_item_get_user.valid?
        expect(@buy_item_get_user.errors.full_messages).to include("クレジットカード情報を入力してください")   
      end

      it 'user_idが空では登録できない' do
        @buy_item_get_user.user_id = nil
        @buy_item_get_user.valid?
        expect(@buy_item_get_user.errors.full_messages).to include("送り先名を入力してください")   
      end

      it 'item_idが空では登録できない' do
        @buy_item_get_user.item_id = nil
        @buy_item_get_user.valid?
        expect(@buy_item_get_user.errors.full_messages).to include("商品名を入力してください")   
      end

      end
   end
  end
end
