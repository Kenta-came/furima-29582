require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '商品出品登録がうまくいくとき' do
      it "nameと、detailとcategoryとconditionとship_costとship_prefとship_dayとpriceとimageが存在すれば登録できる" do
        expect(@item).to be_valid

      end
    end

    context '新規登録がうまくいかないとき' do
      it "nameが空だと登録できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name を入力してください!")
      end
    
      it "detailが空では登録できない" do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail を入力してください!")
      end
      it "categoryが空では登録できない" do
        @item.category = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category の選択を行なってください！")
      end
      it "conditionが空では登録できない" do
        @item.condition = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition の選択を行なってください！")
      end
      it "ship_costが空では登録できない" do
        @item.ship_cost = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship cost の選択を行なってください！")
      end
      it "ship_prefが空では登録できない" do
        @item.ship_pref = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship pref の選択を行なってください！")
      end
      it "ship_dayが空では登録できない" do
        @item.ship_day = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship day の選択を行なってください！")
      end
      it "priceが空では登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price を入力してください！")
      end
      it "priceの範囲が、¥300~¥9,999,999の間でないと保存できない" do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は¥300~¥9,999,999です！")
      end
      it "priceが半角数字以外では登録できない" do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price を半角数字にしてください！")
      end
      it "imageが空では登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Image を選択してください!")
      end
    end
  end
end  
