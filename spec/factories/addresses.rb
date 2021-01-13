FactoryBot.define do
  factory :address do
    association :buyer
    buyer_id             {2}
  end
end
