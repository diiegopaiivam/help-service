namespace :dev do

  desc "Initial Settings"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Drop DB...") { %x(rails db:drop) }
      show_spinner("Create DB...") { %x(rails db:create) }
      show_spinner("Migrate DB...") { %x(rails db:migrate) }
      show_spinner("Create Professions") { %x(rails db:seed) }
      show_spinner("Create anymore employees ") { %x(rails dev:add_more_employees) }
      show_spinner("Create comments for the Employeers") { %x(rails dev:add_comments_employees) }
    else 
      puts "Você não está em ambiente de desenvolvimento"
    end
  end

  # Criando vários trabalhadores
  desc "Create anymore employees"
  task add_more_employees: :environment do
    30.times do |i|
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

  # Criando comentários para os trabalhadores
  desc "Create comments for the Employeers"
  task add_comments_employees: :environment do
    Employee.all.each do |employee| 
      rand(5..10).times do |i| #Cria pelo menos de 5 a 10 comentários por trabalhador
        Comment.create!(
          description: FFaker::Lorem.paragraph,
          employee_id: employee.id
        )
      end 
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