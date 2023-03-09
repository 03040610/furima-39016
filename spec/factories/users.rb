FactoryBot.define do
  factory :user do
    nick_name             {'test'}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {password}
    first_name            {'あ'}
    last_name             {'い'}
    first_kana_name       {'ア'}
    last_kana_name        {'イ'}
    birth_day             {'1946-05-20'}
  end
end