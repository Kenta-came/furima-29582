class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :category 
  has_one :condition
  has_one :ship_cost
  has_one :ship_pref
  has_one :ship_day
  has_one_attached :image

  
  
  validates :image, presence: {
    message: 'を選択してください!'}
  with_options presence: {
    message: 'を入力してください!'} do
    validates :name
    validates :detail
  end
  with_options presence: true, numericality: {other_than: 1, message: 'の選択を行なってください！'} do
    validates :category_id
    validates :condition_id
    validates :ship_cost_id
    validates :ship_pref_id
    validates :ship_day_id
  end

  validates :price, format: {with: /\A\d[0-9]{2,7}/, message: '半角数字で入力してください！'}, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'を¥300~¥9,999,999で入力してください！'}
  
end
