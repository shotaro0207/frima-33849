FactoryBot.define do
  factory :order_destination do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code {'123-4567'}
    prefectures_id {2}
    municipality {'福岡市'}
    adress {'博多区1-1'}
    building {'博多ビル1階'}
    phone_number {'09012345678'}
  end
end
