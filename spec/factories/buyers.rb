FactoryBot.define do
  factory :buyer do
    association :item
    association :user
    association :address
    item_id             {2}
    user_id             {2}
  end
end


