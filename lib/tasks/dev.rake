namespace :dev do
  desc "Configura ambinte de desenvolvimento"
  task setup: :environment do
    %x(`rails db:drop db:create db:migrate`)
    puts 'Criando tipos...'
    kinds = %w[Amigo Comercial Conhecido]
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

    puts 'Criando telefones...'
    Contact.all.each do |c|
      Random.rand(5).times do
        p = Phone.new(number: Faker::PhoneNumber.cell_phone)
        c.phones << p
        c.save!
      end
    end
    puts 'Concluído.'

    puts 'Criando endereços...'
    Contact.all.each do |c|
      Address.create!(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        contact: c
      )
    end
    puts 'Concluído.'
  end
end
