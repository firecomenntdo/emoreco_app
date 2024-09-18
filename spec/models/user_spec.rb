require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'すべての値が正しく入力されていれば登録できる' do
    
    end


    it 'emailが空だと登録できない' do
      
    end
    it 'passwordが空だと登録できない' do
      
    end

    it 'passwordとpassword_confirmationが不一致では登録できない' do
      
    end
    it '重複したemailが存在する場合は登録できない' do
      
    end
    it 'emailは@を含まないと登録できない' do
      
    end
    it 'passwordが6文字未満では登録できない' do
      
    end
    it 'passwordが129文字以上では登録できない' do
      
    end
    it 'passwordが英字のみだと登録できない' do
      
    end
    it 'passwordが数字のみだと登録できない' do
      
    end
  end

end
