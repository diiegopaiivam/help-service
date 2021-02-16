FactoryBot.define do
    factory :comment do 
        description { FFaker::Lorem.paragraph }
        employee_id { 1 }
    end
end