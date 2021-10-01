require 'rails_helper'
RSpec.describe Item, type: :model do
    before do
      @item = FactoryBot.build(:item)
    end
  
    describe "全ての項目が入力されていれば登録できる" do
      context '新規登録できるとき' do
        it 'taitle,comment,item_category_id,item_show_id,delivery_pay_id,delivery_address_id,delivery_day_id,pay,userが紐付いて入力できているとき' do
          expect(@item).to be_valid
        end
      end
  
      context '新規登録できないとき' do
        describe "ユーザー新規登録" do
        it 'titleが空では登録できない' do
          @item.title = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Title can't be blank")   
        end

        it 'commentが空では登録できない' do
          @item.comment = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Comment can't be blank")   
        end

        it 'item_category_idが空では登録できない' do
          @item.item_category_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item category can't be blank")   
        end

        it 'item_show_idが空では登録できない' do
          @item.item_show_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item show can't be blank")   
        end
        
        it 'delivery_pay_idが空では登録できない' do
          @item.delivery_pay_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery pay can't be blank")   
        end

        it 'delivery_address_idが空では登録できない' do
          @item.delivery_address_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery address can't be blank")   
        end

        it 'delivery_day_idが空では登録できない' do
          @item.delivery_day_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery day can't be blank")   
        end

        it '画像が空では登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")   
        end

        it 'user紐付かないと登録できない' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("User must exist")   
        end

        it 'payが空では登録できない' do
          @item.pay = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Pay can't be blank")   
        end

        it 'payが全角では保存できない' do
          @item.pay = 'あいう'
          @item.valid?
          expect(@item.errors.full_messages).to include("Pay is not included in the list")   
        end

        it 'payが英字では保存できない' do
          @item.pay = 'abc'
          @item.valid?
          expect(@item.errors.full_messages).to include("Pay is not included in the list")   
        end

        it 'payが英数字混合では保存できない' do
          @item.pay = 'abc,123'
          @item.valid?
          expect(@item.errors.full_messages).to include("Pay is not included in the list")   
        end

        it 'payが300未満の値では保存できない' do
          @item.pay = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Pay is not included in the list")   
        end

        it '10000000以上の値では保存できない' do
          @item.pay = 10000001
          @item.valid?
          
          expect(@item.errors.full_messages).to include("Pay is not included in the list")   
        end


      end
    end
  end
end
