FactoryBot.define do
  factory :item do
    item_name             {'とってもいい気分'}
    item_column           {'とってもいい商品です'}
    item_price            {Faker::Number.between(from: 300, to: 9999999)}
    item_category_id      {2}
    item_status_id        {2}
    delivery_charge_id    {2}
    prefecture_id         {2}
    item_date_id          {2}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/ゴリラ.jpg'), filename: 'ゴリラ.jpg')
    end
  end
end
