class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :category 
  belongs_to :condition
  belongs_to :ship_cost
  belongs_to :ship_pref
  belongs_to :ship_day
  has_one_attached :image
  has_one :transactions
  
  
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
