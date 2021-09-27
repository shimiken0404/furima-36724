require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "全ての項目が入力されていれば登録できる" do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmationと姓全角と姓カタカナと生年月日が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      describe "ユーザー新規登録" do
        it 'nickname:必須' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it "emailが空では登録できない" do
          user = User.new(nickname: "abe", email: "", password: "00000000", password_confirmation: "00000000")
          user.valid?
          expect(user.errors.full_messages).to include("Email can't be blank")
        end
        
      it '重複したメールアドレスは登録できない' do

      end
      it 'メールアドレスに@を含まない場合は登録できない' do

      end
      it 'パスワードが空では登録できない' do

      end    
      it 'パスワードが6文字未満では登録できない' do

      end
      it '英字のみのパスワードでは登録できない' do

      end
      it '数字のみのパスワードでは登録できない' do

      end
      it '全角文字を含むパスワードでは登録できない' do

      end
      it 'パスワードとパスワード（確認用）が不一致だと登録できない' do

      end
      it '姓（全角）が空だと登録できない' do

      end      
      it '姓（全角）に半角文字が含まれていると登録できない' do

      end
      it '名（全角）が空だと登録できない' do

      end
      it '名（全角）に半角文字が含まれていると登録できない' do

      end
      it '姓（カナ）が空だと登録できない' do

      end 
      it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do

      end
      it '名（カナ）が空だと登録できない' do

      end 
      it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do

      end 
      it '生年月日が空だと登録できない' do

      end 

    end
  end
end
