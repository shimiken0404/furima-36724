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
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")   
      end

      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end

      it '重複したメールアドレスは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end

      it 'メールアドレスに@を含まない場合は登録できない' do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end

      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end    

      it 'パスワードが6文字未満では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end

      it '英字のみのパスワードでは登録できない' do
        @user.password = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
      end

      it '数字のみのパスワードでは登録できない' do
        @user.password = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
      end

      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'あいう'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
      end

      it 'パスワードとパスワード（確認用）が不一致だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it '姓（全角）が空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")   
      end      

      it '姓（全角）に半角文字が含まれていると登録できない' do
        @user.first_name = 'a,1,?'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字全角文字を使用してください")   
      end

      it '名（全角）が空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")   
      end

      it '名（全角）に半角文字が含まれていると登録できない' do
        @user.last_name = 'a,1,?'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前全角文字を使用してください")   
      end

      it '姓（カナ）が空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ミョウジを入力してください")   
      end 

      it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.first_name_kana = 'あ,阿,1,?'
        @user.valid?
        expect(@user.errors.full_messages).to include("ミョウジカタカナを使用してください") 
      end

      it '名（カナ）が空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ナマエを入力してください")   
      end 

      it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.last_name_kana = 'あ,阿,1,?'
        @user.valid?
        expect(@user.errors.full_messages).to include("ナマエカタカナを使用してください")   
      end 

      it '生年月日が空だと登録できない' do
        @user.age = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("年齢を入力してください")   
      end 

    end
  end
end
end