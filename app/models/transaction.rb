class Transaction
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :buyer_id, :post_num, :ship_pref_id, :city, :house_num, :building, :tel, :token, :price

  with_options presence: { message: 'を入力してください！'} do
    validates :city
    validates :house_num
    validates :token
    validates :post_num
    validates :ship_pref_id
    validates :tel
  end
  with_options format: { with: /\A\d{3}-\d{4}\z/, message: 'にハイフンを入力してください！'} do
    validates :post_num
  end
  with_options numericality: {other_than: 1, message: 'の選択を行なってください！'} do
   validates :ship_pref_id
  end
  with_options format: { with: /\A\d{11}\z/, message: 'は11文字入力してください！'} do
    validates :tel
  end
  

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Address.create(post_num: post_num, ship_pref_id: ship_pref_id, city: city, house_num: house_num, building: building, tel: tel, buyer_id: buyer.id)
  end
end