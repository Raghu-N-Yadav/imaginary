FactoryBot.define do
  factory :book do
    title { Faker::Name.name}
    year_published { Faker::Number.within(range: 1800..2020) }
    price { "9.99" }
    out_of_print {false}
    views { Faker::Number.between(from: 100, to: 1000) }
    association :author
    association :supplier

    trait :printed do
      out_of_print {true}
    end

    trait :title_jhon do
      title {"Jhon"}
    end

    factory :printed_book, traits: [:printed, :title_jhon]
  end
end
