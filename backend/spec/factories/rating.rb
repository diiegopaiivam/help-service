FactoryBot.define do
  factory :rating do
    classification { FFaker::Random.rand(1..10) }
    association :employee
  end
end
