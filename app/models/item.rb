class Item < ApplicationRecord
  belongs_to :user
  has_one :category 
  has_one :condition
  has_one :ship_cost
  has_one :ship_pref
  has_one :ship_day
  has_one_attached :image

  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
# 画像投稿のコード
  

# カテゴリーの関するコード
  extend ActiveHash::Associations::ActiveRecordExtensions
  

  

  with_options presence: true, format:{ with: /\A[ぁ-んァ-ン一-龥]\z/, message: 'は必須内容です！'} do
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
  validates :price, presence: true, inclusion: {in: 300..9999999 }, format: {with: /[0-9]/, message: 'は¥300~¥9,999,999です！'}
end
