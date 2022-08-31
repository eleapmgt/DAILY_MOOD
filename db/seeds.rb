# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Reward.destroy_all
User.destroy_all

# For Users Creation

puts "Destroying users..."
puts "Creating users..."


elea = User.create!(email: "uwu@hotmail.com", password: "secret", username: "Uwu")
oceane = User.create!(email: "sese@hotmail.com", password: "secret", username: "Sese")
alexis = User.create!(email: "alpaga@hotmail.com", password: "secret", username: "Alpaga")
sherazade = User.create!(email: "sheshe@hotmail.com", password: "secret", username: "Sheshe")

all_users = [elea, alexis, oceane, sherazade]


puts "#{User.count} users created!"



# For Rewards

puts "Destroying rewards..."
puts "Creating rewards..."


categories = ["music", "article", "citation", "poem", "video", "graphic art", "film"]


url = "https://www.youtube.com/watch?v=4cNJAWY8MKQ&list=OLAK5uy_ljHjl6SDNCIw8cOZMrutKpROHKpC0qsbM&index=2"
Reward.create(category: "musique", content_url: url)

url = "https://www.culturefemme.com/bien-etre/bien-etre-ces-5-boissons-du-matin-qui-font-du-bien-a-votre-corps/"
Reward.create(category: "article", content_url: url)

url = "https://i.pinimg.com/736x/9e/14/f7/9e14f744c7052c8e4e5b81479fa9184e.jpg"
Reward.create(category: "citation", content_url: url)

url = "https://www.youtube.com/watch?v=lpDUObCK1is&t=34s"
Reward.create(category: "video", content_url: url)


puts "#{Reward.count} rewards created!"
