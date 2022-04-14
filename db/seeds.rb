require 'faker'

puts "Destroying all artists"
Artist.destroy_all

10.times do |n|
    artist = Artist.create(
        name: Faker::Name.name,
        nationality: Faker::Nation.nationality,
        birth_date: Faker::Date.between(from: '1980-01-01', to: '2000-12-30'),
        death_date: Faker::Date.between(from: '2010-01-01', to: '2022-12-30'),
        biography: Faker::Quote.famous_last_words
    )
    if artist.save
        puts "Customer #{n+1} created successfully!"
    else
        puts artist.errors.full_messages.join(", ")
    end    
end

