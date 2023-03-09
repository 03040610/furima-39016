FactoryBot.define do
  factory :user do
    nick_name             {'test'}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}+{Faker::Internet.password(Lorem.characters(min_alpha: 1))}+{Faker::Internet.password(Lorem.characters(min_numeric: 1))}
    password_confirmation {password}
    first_name            {'あ'}
    last_name             {'い'}
    first_kana_name       {'ア'}
    last_kana_name        {'イ'}
    birth_day             {'1946-05-20'}
  end
end