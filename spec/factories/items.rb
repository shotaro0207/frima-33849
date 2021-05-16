FactoryBot.define do
  factory :item do
    item_name         {'オムライスの写真'}
    description       {'新品未使用です'}
    category_id       {'3'}
    state_id          {'2'}
    delivery_fee_id   {'2'}
    prefectures_id    {'2'}
    days_id           {'2'}
    price             {'300'}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
