FactoryBot.define do
  factory :item do
    association :user
    name                 {"tarou"}
    detail               {"色"}
    category_id          {2}
    condition_id         {2}
    ship_cost_id         {2}
    ship_pref_id         {2}
    ship_day_id          {2}
    price                {2000}
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
