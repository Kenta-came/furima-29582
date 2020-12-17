class Item < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :ship_cost
  belongs_to :ship_pref
  belongs_to :ship_day
    
  with_options presence: true do
    validates :title
    validates :detail
    validates :price
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :ship_cost_id
      validates :ship_pref_id
      validates :ship_day_id
    end
  end
end
