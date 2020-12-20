class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :category 
  has_one :condition
  has_one :ship_cost
  has_one :ship_pref
  has_one :ship_day
  has_one_attached :image

  
  
# 画像投稿のコード
  

# カテゴリーの関するコード
  
  
  validates :image, presence: {message: 'を選択してください!'}
  with_options presence: {message: 'を入力してください!'} do
    validates :name
    validates :detail
  end
  with_options presence: true, numericality: { other_than: 1, message: 'の選択を行なってください！'} do
    validates :category_id
    validates :condition_id
    validates :ship_cost_id
    validates :ship_pref_id
    validates :ship_day_id
  end
  validates :price, presence:  {message: 'を入力してください！'}, inclusion: {in: 300..9999999, message: 'を半角数字にしてください！' }, format: {with: /[0-9]/, message: 'は¥300~¥9,999,999です！'}
end
