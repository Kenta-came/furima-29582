class Transaction
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :buyer_id, :post_num, :ship_pref_id, :city, :house_num, :building, :tel, :token, :price

  with_options presence: { message: 'を入力してください！'} do
    validates :post_num, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'ハイフンを入力してください！'}
    validates :ship_pref_id, numericality: {other_than: 1, message: 'の選択を行なってください！'} 
    validates :city
    validates :house_num
    validates :tel, format: { with: /\A\d{11}\z/, message: 'ハイフンを入力してください！'}
  end

  validates :price, presence: true
  validates :token, presence: true

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Address.create(post_num: post_num, ship_pref_id: ship_pref_id, city: city, house_num: house_num, building: building, tel: tel, buyer_id: buyer.id)
  end

end