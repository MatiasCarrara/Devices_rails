FactoryBot.define do
  factory :device do
    id 1
    address 1234
    uuid '0e6df4ef-803c-426c-a928-52cca566dc01'

    trait :name do
      name 'iPhone'
    end

    trait :invalid_name do
      name nil
    end
  end
end
