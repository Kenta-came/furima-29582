FactoryBot.define do
  factory :item do
    user_id              {"1"}
    name                 {"tarou"}
    detail               {"色"}
    category_id          {"レディース"}
    condition_id         {"新品、未使用"}
    ship_cost_id         {"着払い"}
    ship_pref_id         {"北海道"}
    ship_day_id          {"2~3"}
    price                {"2000"}
  end
end
