FactoryBot.define do
    factory :employee do 
        first_name { FFaker::Name.first_name }
        last_name { FFaker::Name.last_name }
        phone { FFaker::PhoneNumberBR.phone_number }
        email { FFaker::Internet.email }
        latitude { FFaker::Geolocation.lat }
        longitude { FFaker::Geolocation.lng }
        profession_id { FFaker::Random.rand(1..13) }
    end
end