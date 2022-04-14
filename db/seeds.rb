require 'faker'

puts "Destroying all albums"
Album.destroy_all
puts "Destroying all artists"
Artist.destroy_all

10.times do |n|
    artist = Artist.create(
        name: Faker::Music.band,
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

Artist.all.each do 
    rand(3..6).times do
        album = Album.create(
                name: Faker::Music.album,
                price: rand(1000..9000),
                duration: 0,
                artist_id: Artist.all.sample.id
            )
        if album.save
            puts "Album created successfully!"
        else
            puts album.errors.full_messages.join(", ")
        end
    end
end
