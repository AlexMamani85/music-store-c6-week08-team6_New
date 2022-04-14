require 'faker'

puts "Destroying all songs"
Song.destroy_all
puts "Destroying all details"
Detail.destroy_all
puts "Destroying all albums"
Album.destroy_all
puts "Destroying all artists"
Artist.destroy_all
puts "Destroying orders"
Order.destroy_all
puts "Destroying Customers"
Customer.destroy_all

10.times do |n|
    artist = Artist.create(
        name: Faker::Music.band,
        nationality: Faker::Nation.nationality,
        birth_date: Faker::Date.between(from: '1980-01-01', to: '2000-12-30'),
        death_date: Faker::Date.between(from: '2010-01-01', to: '2022-04-10'),
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

Album.all.each do 
    rand(4..10).times do
        song = Song.create(
                name: Faker::Music::RockBand.song,
                duration: rand(100..240),
                album_id: Album.all.sample.id
            )
        if song.save
            puts "Song created successfully!"
        else
            puts song.errors.full_messages.join(", ")
        end
    end
end

# Method update duration

Song.all.each do |value|
    album_id = Album.find(value.album_id)
    songs = Song.where(album_id: album_id)
    duration = 0
    songs.each do |song|
        duration = song.duration + duration
    end
    album_id.update(duration: duration)
    puts "Album #{album_id.id} has been updated"
end

15.times do |n|
    customer = Customer.new(
      username: Faker::Internet.username(specifier: 8), 
      email: Faker::Internet.safe_email, 
      password: Faker::Internet.password(min_length: 10),
      name: Faker::Name.first_name
    )
  
    if customer.save
      puts "Customer created successfully"
    else
      puts customer.errors.full_messages.join(", ")
    end
end

Customer.all.each do 
    rand(1..5).times do
        order = Order.create(
            date: Faker::Date.between(from: '2010-01-01', to: '2022-04-10'),
            customer_id: Customer.all.sample.id,
            total: 1
        )
        if order.save
            puts "Order created successfully"
        else
            puts order.errors.full_messages.join(", ")
        end
    end
end

Order.all.each do
    detail = Detail.create(
        quantity: rand(1..3),
        album_id: Album.all.sample.id,
        order_id: Order.all.sample.id
    )
    if detail.save
        puts "Detail created successfully"
    else
        puts detail.errors.full_messages.join(", ")
    end
end
