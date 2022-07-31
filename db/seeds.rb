require "faker"
require "json"
require "colorize"

include ApplicationHelper

welcome

puts "#{'Destroying all albums_orders'.red.italic}"
AlbumsOrder.destroy_all

puts "#{'Destroying all songs'.red.italic}"
Song.destroy_all

puts "#{'Destroying all albums'.red.italic}"
Album.destroy_all

puts "#{'Destroying all orders'.red.italic}"
Order.destroy_all

puts "#{'Destroying all customers'.red.italic}"
Customer.destroy_all

puts "#{'Destroying all artists'.red.italic}"
Artist.destroy_all

loading
puts "#{'Starting seeding all Artists'.yellow}"
# Create 10 artists
10.times do
  #This verifies if the nationality gets added to the artist
  nationality = rand(1..10) > 6 ? Faker::Nation.nationality : nil

  #This verifies if the birth and deatg dates get added
  birth_date = rand(1..10) > 6 ? Faker::Date.birthday(min_age: 10, max_age: 120) : nil
  death_date = nil
  if birth_date
    if rand(1..10) > 6
      death_date = Faker::Date.between(from: birth_date, to: Date.today)
 
      death_date = nil if death_date.year - birth_date.year < 10
    end
  end

  # This verifies if the artist introduce biography 
  biography =  rand(1..10) > 4 ? Faker::Lorem.paragraph : nil
  artist = Artist.create(name: Faker::Music.unique.band, nationality:nationality, birth_date:birth_date, death_date: death_date, biography: biography)
  
  if !artist.persisted?
    puts artist.errors.full_messages
    p artist
  end
end
puts "#{'Finished seeding Artists'.green}"
puts "----------------------"
puts "#{'Starting seeding all Albums'.yellow}"
# Create between 2 to 6 albums for each artist.
data_artists = Artist.all
data_artists.each do |artist|
  rand(2..6).times do
    album = Album.create(name: Faker::Music.unique.album, price: Faker::Number.number(digits: 5), artist_id: artist.id)

    if !album.persisted?
      puts album.errors.full_messages
      p album
    end
  end
end
puts "#{'Finished seeding Albums'.green}"
puts "----------------------"
puts "#{'Starting seeding all Songs'.yellow}"
# Create between 4 and 10 songs for each album.
data_albums = Album.all
data_albums.each do |data_album|
  rand(4..10).times do
    song = Song.create(name: Faker::Music::RockBand.song, duration: Faker::Number.number(digits: 3), album_id: data_album.id)

    if !song.persisted?
      puts song.errors.full_messages
      p song
    end
  end
end
puts "#{'Finished seeding Songs'.green}"
puts "----------------------"
puts "#{'Starting seeding all Customers'.yellow}"
# Create 15 customers
  15.times do
    password = Faker::Internet.password(min_length: 5) + rand(0..9).to_s
    customer = Customer.create(username: Faker::Internet.unique.username, email: Faker::Internet.unique.safe_email, password: password, name: Faker::Name.unique.name)

    if !customer.persisted?
      puts customer.errors.full_messages
      p customer
    end
  end
puts "#{'Finished seeding Customers'.green}"
puts "----------------------"
puts "#{'Starting seeding all Orders'.yellow}"
# Create between 1 and 5 orders for each customer.
customer = Customer.all
customer.each do |customer|
  rand(1..5).times do
    c_order = Order.create(date: Faker::Date.between(from: '2002-07-08', to: Date.today), total: 1,
     customer_id: customer.id)

    if !c_order.persisted?
      puts c_order.errors.full_messages
      p c_order
    end
  end
end
puts "#{'Finished seeding Orders'.green}"
puts "----------------------"
puts "#{'Starting seeding all Album Orders'.yellow}"
# Create between 1 and 5 orders for each customer.
data_orders = Order.all
data_orders.each do |order|
  albums = Album.all.to_a
  rand(1..4).times do
    album = nil
    loop do
      album = albums.sample
    
      # This search if the album is or not in the same order, to not have it twice
      album_order = AlbumsOrder.find_by(order_id: order.id, album_id: album.id)
      id = album_order.nil? ? 0 :  album_order.id
      break if album.id != id
      
    end

    album_quantity = rand(1..3)
    album_orders = AlbumsOrder.create(sub_total: album.price * album_quantity, album_quantity: album_quantity,
    album_id: album.id, order_id: order.id)

    if !album_orders.persisted?
      puts album_orders.errors.full_messages
      p album_orders
    end
  end
end
puts "#{'Finished seeding Album Orders'.green}"

# Adds duration of Album
albums = Album.all
albums.each do |album|
  songs = Song.where(album_id: album.id)
  duration_total = 0
  songs.each do |song|
    duration_total += song.duration
  end
  album.duration = duration_total
  album.save
end

# Adds total of Orden
orders = Order.all
orders.each do |order|
  albums_orders = AlbumsOrder.where(order_id: order.id)
  total = 0
  albums_orders.each do |album_order|
    total += album_order.sub_total
  end
  order.total = total
  order.save
end
