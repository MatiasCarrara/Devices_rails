FactoryBot.define do

  factory :device do
    id 1
    address 1234

    trait :name do
      name "iPhone"
    end

    trait :invalid_name do
      name nil
    end
  end
end
