FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    password { 'secret' }

    trait :admin do
      admin { true }
    end

    trait :participant do
      admin { false }
    end

    factory :admin, traits: [:admin]
    factory :participant, traits: [:participant]
  end
end
