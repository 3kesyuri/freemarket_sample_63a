FactoryBot.define do
  factory :destination do
    id                        {4}
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
    user_id                 {3}
    created_at                 {"2020-02-2904:35:26"}
    updated_at                 {"2020-02-2904:35:26"}

  end
end
