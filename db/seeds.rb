# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Reward.destroy_all
User.destroy_all
Category.destroy_all

# For Rewards

# puts "Destroying rewards..."
# puts "Creating rewards..."


puts "Destroying categories..."
puts "Creating categories..."

principal_category = Category.create!(title: "humeur generale")


sport = Category.create!(title: "sport")
travail = Category.create!(title: "Travail")
famille = Category.create!(title: "Famille")
social = Category.create!(title: "social")
sommeil = Category.create!(title: "sommeil")
loisirs = Category.create!(title: "loisirs")
alimentation = Category.create!(title: "alimentation")
culture = Category.create!(title: "culture")
motivation = Category.create!(title: "motivation")
gestion_du_stress = Category.create!(title: "gestion du stress")

secondary_categories = [sport, travail, famille, social, sommeil, gestion_du_stress]


puts "#{Category.count} categories created!"


categories = ["music", "article", "citation", "poem", "video", "graphic art", "film"]


 url = "https://www.youtube.com/watch?v=4cNJAWY8MKQ&list=OLAK5uy_ljHjl6SDNCIw8cOZMrutKpROHKpC0qsbM&index=2"
 Reward.create(category: "musique", content_url: "https://www.youtube.com/watch?v=4cNJAWY8MKQ&list=OLAK5uy_ljHjl6SDNCIw8cOZMrutKpROHKpC0qsbM&index=2")

 url = "https://www.culturefemme.com/bien-etre/bien-etre-ces-5-boissons-du-matin-qui-font-du-bien-a-votre-corps/"
 Reward.create(category: "article", content_url: url)

 url = "https://i.pinimg.com/736x/9e/14/f7/9e14f744c7052c8e4e5b81479fa9184e.jpg"
 Reward.create(category: "citation", content_url: url)

 url = "https://www.youtube.com/watch?v=lpDUObCK1is&t=34s"
 Reward.create(category: "video", content_url: url)


puts "#{Reward.count} rewards created!"

# For Users Creation

puts "Destroying users..."
puts "Creating users..."


elea = User.create!(email: "uwu@hotmail.com", password: "secret", username: "Uwu", )
oceane = User.create!(email: "sese@hotmail.com", password: "secret", username: "Sese")
alexis = User.create!(email: "alpaga@hotmail.com", password: "secret", username: "Alpaga")
sherazade = User.create!(email: "sheshe@hotmail.com", password: "secret", username: "Sheshe")

all_users = [elea, alexis, oceane, sherazade]

puts "#{User.count} users created!"

all_users.each do |user|
  # creer un user catégorie pour l'humeur generale avec position 1
  categories = [principal_category] + secondary_categories.sample(3)
  # pour chaque user on prend 3 catégorie aleatoire  et créer un user_categorie + position 2, 3 et 4
  categories.each_with_index do |cat, i|
    UserCategory.create!(user: user, category: cat, position: i + 1)
  end
end


start_date = 1.week.ago.to_date
end_date = Date.today
(start_date..end_date).each do |day|
  # pour chaque jours je créer un daily a la date
  d = Diary.create!(gratitude: Faker::Lorem.paragraphs(number: 2), user: sherazade, date: day)
  d.user.categories.each do |cat|
    Mood.create!(diary: d, principal: cat == principal_category, rating: rand(-5..5), category: cat)
  puts day
  end
  DiaryReward.create!(diary: d, reward: Reward.all.sample)
end

puts "#{Mood.count} moods created!"
