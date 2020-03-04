FactoryBot.define do
  factory :destination do
    family_name               {"山田"}
    last_name                 {"太郎"}
    family_name_kana          {"ヤマダ"}
    last_name_kana            {"タロウ"}
    zip_code               {1234567}
    prefecture                 {"北海道"}
    municipality          {"市町村"}
    address            {"12-5"}
    apartment_name  {"マンション"}
    phone_number            {12345678910}
    user_id                 {1}

  end
end
