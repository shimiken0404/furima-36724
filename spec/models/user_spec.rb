require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

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
  end
end

#      binding.pry