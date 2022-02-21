require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it 'nickname、email、passward、password_confirmationが存在すれば登録できる。' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない時' do
      it 'nicknameが空では登録できない' do
      end
      it 'emailが空では登録できない' do
      end
      it 'passwardが空では登録できない' do
      end
      it 'password_confirmationが空では登録できない' do
      end
      it 'passwardとpassword_confirmationが不一致では登録できない' do
      end
      it 'passwordが半角数字のみの場合は登録できない' do
      end
      it 'passwordが半角英字のみの場合は登録できない' do
      end
      it 'passwordは半角英数字混合でないと登録できない' do
      end
      it 'emailは@を含まないと登録できない' do
      end
      it '重複したemailが存在する場合は登録できない' do
      end
      it 'passwordは6文字以上でないと登録できない' do
      end
    end
  end
end
