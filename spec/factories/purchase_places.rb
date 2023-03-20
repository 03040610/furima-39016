FactoryBot.define do
  factory :purchase_place do
    post_code             {'123-6671'}
    prefecture_id         {4}
    city                  {'豊島区'}
    address               {'池袋'}
    building_name         {'嵯峨崎'}
    phone_number          {Faker::Number.between(from: 1000000000, to: 10000000000)}
    token                 {'tok_4b21329619a7f63b6f8b20406708'}
  end
end
