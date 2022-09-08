# url = "https://www.culturefemme.com/bien-etre/bien-etre-ces-5-boissons-du-matin-qui-font-du-bien-a-votre-corps/"
# https://github.com/wbdana/opengraph-io-ruby
# https://dashboard.opengraph.io/apis/Opengraphio

Reward.destroy_all
User.where(is_doctor: false).destroy_all
User.destroy_all
Category.destroy_all

# FOR CATEGORIES

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

# FOR REWARDS

puts "Destroying rewards..."
puts "Creating rewards..."

categories = ["music", "article", "citation", "poem", "video", "graphic art", "film"]

url = '<iframe width="300" height="300" src="https://www.youtube.com/embed/4cNJAWY8MKQ?list=OLAK5uy_ljHjl6SDNCIw8cOZMrutKpROHKpC0qsbM" title="Moments paisibles" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>'
Reward.create(category: "musique", content_url: url)

url =  {
  "title"=>"Bien-être : Ces 5 boissons du matin qui font du bien à votre corps !",
  "description"=>  "Contrairement à ce qu’on peut penser, ces nourritures et breuvages sont faciles à trouver, peu coûteux et faciles à préparer. Retrouvez ici 5 de ces boissons que vous pouvez prendre le matin et qui feront beaucoup de bien à votre corps. Le thé vert, qui contient des antioxydants Prendre un thé détox en début de...",
  "type"=>"article",
  "locale"=>"fr_FR",
  "image"=>  "https://www.culturefemme.com/wp-content/uploads/2022/08/5-boissons-du-matin-qui-font-du-bien-a-votre-corps-e1661496977482.jpg",
  "imageType"=>"image/jpeg",
  "imageWidth"=>"1200",
  "imageHeight"=>"630",
  "url"=>"https://www.culturefemme.com/bien-etre/bien-etre-ces-5-boissons-du-matin-qui-font-du-bien-a-votre-corps/",
  "favicon"=>  "https://www.culturefemme.com/wp-content/uploads/2020/12/xculturefemme-300x300.png.pagespeed.ic.ejcQYe2Yac.webp",
  "site_name"=>"Culturefemme.com",
  "articlePublishedTime"=>"2022-08-26T07:30:00+00:00",
  "articleModifiedTime"=>"2022-08-26T06:56:52+00:00"
}.to_json

 Reward.create(category: "article", content_url: url)

 url = "https://i.pinimg.com/736x/9e/14/f7/9e14f744c7052c8e4e5b81479fa9184e.jpg"
 Reward.create(category: "citation", content_url: url)

 url = '<iframe width="300" height="300" src="https://www.youtube.com/embed/lpDUObCK1is" title="Vers une vie sereine: MEDITATION guidée - Etre présent (mindfulness - pleine conscience)" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>'
 Reward.create(category: "video", content_url: url)

puts "#{Reward.count} rewards created!"

# FOR DOCTOR

puts "Destroying doctor..."
puts "Creating doctor..."

doctor = User.create(username: "DrMundo", email: "mundodu33@hotmail.com", password: "secret")
doctor.update(is_doctor: true)

puts "#{User.count} doctor created!"

# FOR USERS

puts "Destroying users..."
puts "Creating users..."

elea = User.create!(email: "uwu@hotmail.com", password: "secret", username: "Uwu")
oceane = User.create!(email: "sese@hotmail.com", password: "secret", username: "Sese")
alexis = User.create!(email: "alpaga@hotmail.com", password: "secret", username: "Alpaga")
sherazade = User.create!(email: "sheshe@hotmail.com", password: "secret", username: "Sheshe")

# all_users = [elea, alexis, oceane, sherazade]

users = []
usernames = []
50.times do
  fake_name = Faker::Games::LeagueOfLegends.champion
  usernames << fake_name if !usernames.include?(fake_name) && fake_name != "Dr. mundo"
end

index_name = 0
21.times do
  username = usernames[index_name]
  users << User.create(username: username, email: "#{username.parameterize(separator: '_')}@hotmail.com", password: "secret", doctor_id: doctor.id)
  index_name += 1
end

puts "#{User.count - 1} users created!"

# all_users.each do |user|
#   # creer un user catégorie pour l'humeur generale avec position 1
#   categories = [principal_category] + secondary_categories.sample(3)
#   # pour chaque user on prend 3 catégories aleatoires et créer un user_categorie + position 2, 3 et 4
#   categories.each_with_index do |cat, i|
#     UserCategory.create!(user: user, category: cat, position: i + 1)
#   end
# end

puts "Destroying moods..."
puts "Creating moods..."

gratitude_text = ["Aujourd'hui, je me suis senti bien. J'ai été faire une balade avec mes enfants et j'ai rendu visite à une amie.",
                  "Je suis rentré de vacances et c'était trop bien. J'ai pu profiter de la mer et des couchers de soleil et prendre du temps pour moi.",
                  "Je suis en repos et j'en ai profité pour ranger mon appartement, faire des courses et me promener au bord de la rivière.", "Ce jour, j'ai démarré mon nouveau poste eu seing de l'entreprise, pleins de nouveau projet sont à venir et cela me réjouit. J'ai aussi été boire un verre avec un ami de longue date.",
                  "Après ma journée de travail, je suis allé faire du sport et j'ai rejoint des amis en centre-ville pour manger au restaurant.",
                  "J'ai posé mes jours de congés pour cet hiver et j'ai commencé a réservé des activités en famille. J'ai également rendu visite à mes grands-parents.",
                  "Je me suis réveillé de bonne humeur et j'ai décidé de rejoindre des amis en vacances dans le sud-est. Je suis excité a l'idée de changer d'air et passer du bon temps.",
                  "En ce jour, j'ai pris du temps pour prendre soin de moi : je suis allé faire un massage et en rentrant, j'ai pris un bain. Je suis contente d'avoir réussi a accepté de ne pas être productive et de seulement pensé a mon bien être.",
                  "Même s'il est difficile de trouver du positif dans cette journée, j'ai pris un rendez-vous médical important.",
                  "Aujourd'hui, j'ai joué avec mon chat et j'ai commencé une série que je voulais voir depuis longtemps."]

content_text = ["J'ai eu une altercation avec un ami", "J'ai fait une insomnie",
                "Beaucoup de stress pour mon entretien d'embauche",
                "Mon manager m'a mis la pression pour le rendez-vous client de mercredi prochain",
                "Je n'ai pas fait grand chose aujourd'hui", "Je ressens beaucoup de fatigue",
                "Ma sœur est partie dans un autre pays, ça me pèse car nous sommes très proches",
                "Mon meilleur ami a déménagé et je vais le voir moins souvent", "J'ai dû emmener mon chat chez le véto",
                "J'ai raté mon entretien d'embauche"]

start_date = 1.week.ago.to_date
end_date = Date.today - 1.day
index = 0
content_index = 0
grat_index = 0
all_rewards = Reward.all
(start_date..end_date).each do |day|
  # pour chaque jours je créer un daily a la date
  # d = Diary.create!(gratitude: Faker::Lorem.paragraphs(number: 2), user: sherazade, date: day)
  diary_elea = Diary.create!(gratitude: gratitude_text[index], user: elea, date: day)
  diary_sherazade = Diary.create!(gratitude: gratitude_text[index], user: sherazade, date: day)
  diary_oceane = Diary.create!(gratitude: gratitude_text[index], user: oceane, date: day)
  diary_alexis = Diary.create!(gratitude: gratitude_text[index], user: alexis, date: day)
  index += 1

  users.each do |user|
    diary_user = Diary.create!(gratitude: gratitude_text[grat_index], user: user, date: day)
    user.categories.each do |cat|
      if cat == principal_category
        content = content_text[content_index]
      else
        content = nil
      end
      Mood.create!(diary: diary_user, principal: cat == principal_category, rating: rand(-5..5), category: cat, content: content)
      content_index += 1
    end
    DiaryReward.create!(diary: diary_user, reward: all_rewards.sample)
    grat_index += 1
  end

  elea.categories.each do |cat|
    if cat == principal_category
      content = content_text[content_index]
    else
      content = nil
    end
    Mood.create!(diary: diary_elea, principal: cat == principal_category, rating: rand(-5..5), category: cat, content: content)
  end
  DiaryReward.create!(diary: diary_elea, reward: all_rewards.sample)

  sherazade.categories.each do |cat|
    if cat == principal_category
      content = content_text[content_index]
    else
      content = nil
    end
    Mood.create!(diary: diary_sherazade, principal: cat == principal_category, rating: rand(-5..5), category: cat, content: content)
  end
  DiaryReward.create!(diary: diary_sherazade, reward: all_rewards.sample)

  oceane.categories.each do |cat|
    if cat == principal_category
      content = content_text[content_index]
    else
      content = nil
    end
    Mood.create!(diary: diary_oceane, principal: cat == principal_category, rating: rand(-5..5), category: cat, content: content)
  end
  DiaryReward.create!(diary: diary_oceane, reward: all_rewards.sample)

  alexis.categories.each do |cat|
    if cat == principal_category
      content = content_text[content_index]
    else
      content = nil
    end
    Mood.create!(diary: diary_alexis, principal: cat == principal_category, rating: rand(-5..5), category: cat, content: content)
  end
  DiaryReward.create!(diary: diary_alexis, reward: all_rewards.sample)
end

puts "#{Mood.count} moods created!"
