FactoryBot.define do
  factory :user do
    id 1
    last_name "DC"
    email "@prueba"

    trait :first_name do
      first_name "Marvel"
    end

    trait :invalid_first_name do
      name nil
    end
  end
end
