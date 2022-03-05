FactoryBot.define do
  factory :supplier do
    name { Faker::Name.name }
    
    transient do
      upcased {false}
    end    
  end
  
  after(:build) do |supplier, evaluator|
    supplier.name.upcase! if evaluator.upcased
  end

end
