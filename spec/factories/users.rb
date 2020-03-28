FactoryBot.define do

  factory :user do
    id                    {"1"}
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    family_name           {"田中"}
    last_name             {"一郎"}
    family_name_kana      {"タナカ"}
    last_name_kana        {"イチロウ"}
    birth_year            {"2000"}
    birth_month           {"11"}
    birth_day             {"22"}
  end

end