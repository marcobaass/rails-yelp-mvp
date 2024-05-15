# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."
inizio = { name: "Inizio Ristorante Bar", address: "Fasanenstraße 77, 10623 Berlin Deutschland", phone_number: "+49 30 959999131", category: "italian" }
buschbeck = { name: "Restaurant Buschbeck's", address: "Trendelenburgstr. 14, 14057 Berlin Deutschland", phone_number: "+49 30 32604166", category: "belgian" }
focaccino = { name: "Focaccino", address: "Stuttgarter Platz 16 Charlottenburg,Wilmesdorf, 10627 Berlin Deutschland", phone_number: "+49 30 3248838", category: "italian" }
hackethals = { name: "Hackethals", address: "Pflugstrasse 11, 10115 Berlin Deutschland", phone_number: "+49 30 28387765", category: "belgian" }
cafe_couscous = { name: "Café Couscous", address: "Friedrichstr. 115, 10117 Berlin Deutschland", phone_number: "+49 30 55070382", category: "french" }

[inizio, buschbeck, focaccino, hackethals, cafe_couscous].each do |attributes|
  rate = rand(0..5)
  restaurant = Restaurant.create!(attributes)
  reviews = Review.create!(content: "super", rating: rate, restaurant_id: restaurant.id)
  puts "Created #{restaurant.name}"
end
puts "Finished!"

# inizio = { name: "Inizio Ristorante Bar", address: "Fasanenstraße 77, 10623 Berlin Deutschland", rating: 4 }
# buschbeck = { name: "Restaurant Buschbeck's", address: "Trendelenburgstr. 14, 14057 Berlin Deutschland", rating: 5 }
# focaccino = { name: "Focaccino", address: "Stuttgarter Platz 16 Charlottenburg,Wilmesdorf, 10627 Berlin Deutschland",
# rating: 4 }
# hackethals = { name: "Hackethals", address: "Pflugstrasse 11, 10115 Berlin Deutschland", rating: 4 }
# cafe_couscous = { name: "Café Couscous", address: "Friedrichstr. 115, 10117 Berlin Deutschland", rating: 5 }
