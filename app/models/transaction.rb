class Transaction
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :buyer_id, :post_num, :ship_pref_id, :city, :house_num, :building, :tel, :token

  with_options presence: { message: 'を入力してください！'} do
    validates :item_id
    validates :user_id
    validates :city
    validates :house_num
    validates :token
    validates :post_num, format: { with: /\A\d{3}-\d{4}\z/, message: 'にハイフンを入力してください！'}
    validates :ship_pref_id, numericality: {other_than: 1, message: 'の選択を行なってください！'}
    validates :tel, format: { with: /\A\d{11}\z/, message: 'は11文字入力してください！'}
  end
  
  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Address.create(post_num: post_num, ship_pref_id: ship_pref_id, city: city, house_num: house_num, building: building, tel: tel, buyer_id: buyer.id)
  end
   
end