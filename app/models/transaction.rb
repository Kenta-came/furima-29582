class Transaction
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :buyer_id, :post_num, :ship_pref_id, :city, :house_num, :building, :tel

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Address.create(post_num: post_num, ship_pref_id: ship_pref_id, city: city, house_num: house_num, building: building, buyer_id: buyer.id)
  end

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :ship_pref
  
end