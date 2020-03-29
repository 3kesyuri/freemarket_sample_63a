FactoryBot.define do
  factory :product do
    id                {"1"}
    name              {"名前"}
    description       {"説明文"}
    condition         {"未使用に近い"}
    delivery_charge   {"着払い(購入者負担)"}
    delivery_origin   {"福岡"}
    shipping_date     {"2~3日で配送"}
    price             {"2000"}
    association :user
    association :category
    association :brand
  end
end
