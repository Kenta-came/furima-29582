require 'rails_helper'

RSpec.describe Transaction, type: :model do
  before do
    item = FactoryBot.create(:item)
    sleep 1
    user = FactoryBot.create(:user)
    @transaction = FactoryBot.build(:transaction, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '商品購入機能がうまくいくとき' do
      it "item_idとuser_idとtokenとbuyer_idとpost_numとcityとship_pref_idとhouse_numとbuildingとtelが存在すれば登録できる" do
        expect(@transaction).to be_valid
      end
    end

    context '商品購入機能がうまくいかないとき' do
      it "tokenが空だと登録できない" do
        @transaction.token = nil
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Token を入力してください！")
      end
      it "post_numが空では登録できない" do
        @transaction.post_num = ''
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Post num を入力してください！")
      end
      it "post_num にハイフンがないと登録できない" do
        @transaction.post_num = '0000000'
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Post num にハイフンを入力してください！")
      end
      it "ship_prefが『1』では登録できない" do
        @transaction.ship_pref_id = 1
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Ship pref の選択を行なってください！")
      end
      it "cityが空では登録できない" do
        @transaction.city = ''
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("City を入力してください！")
      end
      it "house_numが空では登録できない" do
        @transaction.house_num = ''
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("House num を入力してください！")
      end
      it "telが空では登録できない" do
        @transaction.tel = ''
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Tel を入力してください！")
      end
      it "telが10文字以下では登録できない" do
        @transaction.tel = '0000000000'
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Tel は11文字入力してください！")
      end
    end
  end
end
