class Buyer < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :address
  belongs_to :ship_pref
end
