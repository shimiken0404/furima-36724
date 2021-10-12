require 'rails_helper'

RSpec.describe BuyItemGetUser, type: :model do
  before do
    user = FactoryBot.build(:user)
    item = FactoryBot.build(:item)
    @buy_item_get_user = FactoryBot.build(:buy_item_get_user, user: user.id, item: item.id) 
  end

  describe "全ての項目が入力されていれば登録できる" do
    context '購入することができるとき' do
      it 'postal_code,delivery_address_id,address_city,address_number,telephone_number,address_building,tokenが入力できているとき' do
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
        expect(@buy_item_get_user.errors.full_messages).to include("Postal code can't be blank")   
       end
      
       it 'postal_codeハイフンなしでは登録できない' do
        @buy_item_get_user.postal_code = '1234567'
        @buy_item_get_user.valid?
        expect(@buy_item_get_user.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")   
       end

       it 'delivery_address_idが空では登録できない' do
        @buy_item_get_user.delivery_address_id = ''
        @buy_item_get_user.valid?
        expect(@buy_item_get_user.errors.full_messages).to include("Delivery address can't be blank")   
      end
      it 'delivery_address_idが0では登録できない' do
        @buy_item_get_user.delivery_address_id = '0'
        @buy_item_get_user.valid?
        expect(@buy_item_get_user.errors.full_messages).to include("Delivery address can't be blank")   
      end

      it 'address_cityが空では登録できない' do
        @buy_item_get_user.address_city = ''
        @buy_item_get_user.valid?
        expect(@buy_item_get_user.errors.full_messages).to include("Address city can't be blank")   
      end

      it 'address_numberが空では登録できない' do
        @buy_item_get_user.address_number = ''
        @buy_item_get_user.valid?
        expect(@buy_item_get_user.errors.full_messages).to include("Address number can't be blank")   
      end

      it 'telephone_numberが空では登録できない' do
        @buy_item_get_user.telephone_number = ''
        @buy_item_get_user.valid?
        expect(@buy_item_get_user.errors.full_messages).to include("Telephone number can't be blank")   
      end
      it 'telephone_numberが10桁以上11桁以内の数値では登録できない' do
        @buy_item_get_user.telephone_number = '123456789'
        @buy_item_get_user.valid?
        expect(@buy_item_get_user.errors.full_messages).to include("Telephone number is too short (minimum is 10 characters)")   
      end
      it 'telephone_numberが10桁以上11桁以内の数値では登録できない' do
        @buy_item_get_user.telephone_number = '1234567891011'
        @buy_item_get_user.valid?
        expect(@buy_item_get_user.errors.full_messages).to include("Telephone number is too long (maximum is 11 characters)")   
      end
      it 'telephone_numberが全角数字では登録できない' do
        @buy_item_get_user.telephone_number = '１２３４'
        @buy_item_get_user.valid?
        expect(@buy_item_get_user.errors.full_messages).to include("Telephone number 電話番号は、10桁以上11桁以内の半角数値のみ保存可能")   
      end

      it 'tokenが空では登録できない' do
        @buy_item_get_user.token = ''
        @buy_item_get_user.valid?
        expect(@buy_item_get_user.errors.full_messages).to include("Token can't be blank")   
      end

      end
   end
  end
end
