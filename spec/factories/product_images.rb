FactoryBot.define do
  factory :product_image do
    image              {"neko1.jpg"}
    association :product
    
  end
end
