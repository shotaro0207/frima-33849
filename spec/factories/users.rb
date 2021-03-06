FactoryBot.define do
  factory :user do
    nickname               {'山'}
    email                  {Faker::Internet.free_email}
    password               {'lmn123'}
    password_confirmation  {'lmn123'}
    last_name              {'山田'}
    first_name             {'太郎'}
    last_name_kana         {'ヤマダ'}
    first_name_kana        {'タロウ'}
    birthday               {'1997-02-08'}
  end
end