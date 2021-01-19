namespace :dev do

  desc "Initial Settings"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Create anymore employees ") { %x(rails dev:add_more_employees) }
    else 
      puts "Você não está em ambiente de desenvolvimento"
    end
  end

  desc "Create anymore employees"
  task add_more_employees: :environment do
    20.times do |i|
      Employee.create!(
        first_name: FFaker::Name.first_name,
        last_name: FFaker::Name.last_name,
        email: FFaker::Internet.email,
        phone: FFaker::PhoneNumberBR.phone_number,
        latitude: FFaker::Geolocation.lat,
        longitude: FFaker::Geolocation.lng,
        profession_id: FFaker::Random.rand(1..13)
      )
    end
  end
    
  private
    def show_spinner(msg_start, msg_end = "Concluído!")
      spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
      spinner.auto_spin
      yield
      spinner.success("(#{msg_end})")
    end

      
end