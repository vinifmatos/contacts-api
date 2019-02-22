namespace :dev do
  desc "Configura ambinte de desenvolvimento"
  task setup: :environment do
    puts 'Criando tipos...'
    kinds = %w(Amigo Comercial Conhecido)
    kinds.each do |k|
      Kind.create!(description: k)
    end
    puts 'Concluído'

    puts 'Criando contatos...'
    100.times do
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(35.years.ago, 18.years.ago),
        kind: Kind.all.sample
      )
    end
    puts 'Concluído.'
  end
end
