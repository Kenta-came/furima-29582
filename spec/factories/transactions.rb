FactoryBot.define do
  factory :transaction do
    post_num             {"111-1111"}
    ship_pref_id         {2}
    city                 {"横浜市緑区"}
    house_num            {"青山1-1-1"}
    building             {"柳ビル103"}
    tel                  {"11111111111"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
