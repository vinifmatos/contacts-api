namespace :dev do
  desc "Configura ambinte de desenvolvimento"
  task setup: :environment do
    puts 'Criando contatos...'
    100.times do
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(35.years.ago, 18.years.ago)
      )
    end
    puts 'Concluído.'
  end
end
