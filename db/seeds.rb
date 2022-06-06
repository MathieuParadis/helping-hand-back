p "*" * 50
p " " * 50
p "                 STARTING SEEDING                 "
p " " * 50
p "*" * 50

p "Destroy curent data..."

p "Destroying requests... #{Request.count} "
Request.destroy_all

p "Destroying users... #{User.count} "
User.destroy_all

p "-" * 50
p "-" * 50

############################################
users_number = 3
users_count = 0

requests_number = 10
requests_count = 0

############################################

p "Creating users"

User.create(first_name: "Gabriel", last_name: "Green", email: "gabriel.green@yopmail.com", password: "azerty123", password_confirmation: "azerty123", id_card_url: "https://png.pngtree.com/element_our/png_detail/20190103/id-card-line-black-icon-png_309153.jpg").id_card.attach(io: File.open('app/assets/images/IDcard.png'), filename: 'IDcard.png')
users_count += 1
system("clear")
puts "#{users_count} users created"
puts "|"+("█"*users_count)+(" "*(users_number-users_count))+"|"

User.create(first_name: "Connie", last_name: "Brown", email: "connie.brown@yopmail.com", password: "azerty123", password_confirmation: "azerty123", id_card_url: "https://png.pngtree.com/element_our/png_detail/20190103/id-card-line-black-icon-png_309153.jpg").id_card.attach(io: File.open('app/assets/images/IDcard.png'), filename: 'IDcard.png')
users_count += 1
system("clear")
puts "#{users_count} users created"
puts "|"+("█"*users_count)+(" "*(users_number-users_count))+"|"

User.create(first_name: "Melanie", last_name: "Jones", email: "melanie.jones@yopmail.com", password: "azerty123", password_confirmation: "azerty123", id_card_url: "https://png.pngtree.com/element_our/png_detail/20190103/id-card-line-black-icon-png_309153.jpg").id_card.attach(io: File.open('app/assets/images/IDcard.png'), filename: 'IDcard.png')
users_count += 1
system("clear")
puts "#{users_count} users created"
puts "|"+("█"*users_count)+(" "*(users_number-users_count))+"|"



p "Creating Requests"

Request.create(
  title:"In need of 2 blankets",
  request_type: "material",
  location: "Wan Chai",
  lat: 22.2770,
  lng: 114.1723,
  description:"I would like to get 2 old blankets to use as a bed for my dogs.",
  user_id: User.all.sample.id
)
requests_count += 1
system("clear")
puts "#{requests_count} requests created"
puts "|"+("█"*requests_count)+(" "*(requests_number-requests_count))+"|"


Request.create(
  title: "Need help to vacuum clean my car",
  request_type: "service",
  location: "Causeway Bay",
  lat: 22.28598,
  lng: 114.19149,
  description: "I would like someone to help to clean the insde of my car.",
  user_id: User.all.sample.id
)
requests_count += 1
system("clear")
puts "#{requests_count} requests created"
puts "|"+("█"*requests_count)+(" "*(requests_number-requests_count))+"|"


Request.create(
  title: "Looking for someone to walk my dog",
  request_type: "service",
  location: "Happy Valley",
  lat: 22.2667,
  lng: 114.1833,
  description: "Looking for an enegertic volunteer to walk my dog from 6 to 7pm.",
  user_id: User.all.sample.id
)
requests_count += 1
system("clear")
puts "#{requests_count} requests created"
puts "|"+("█"*requests_count)+(" "*(requests_number-requests_count))+"|"


Request.create(
  title: "Need bikes",
  request_type: "material",
  location: "Pok Fu Lam",
  lat: 22.2600,
  lng: 114.1377,
  description: "Looking for people to give away there old bikes to my local school to teach them how to ride.",
  user_id: User.all.sample.id
)
requests_count += 1
system("clear")
puts "#{requests_count} requests created"
puts "|"+("█"*requests_count)+(" "*(requests_number-requests_count))+"|"


Request.create(
  title: "Looking for babysitter",
  request_type: "service",
  location: "Mong Kok",
  lat: 22.3222,
  lng: 114.1699,
  description: "My husband and I are going out on saturday night from 8 to 11pm. Looking for babysitter for my 2 kids, aged 8 and 10.",
  user_id: User.all.sample.id
)
requests_count += 1
system("clear")
puts "#{requests_count} requests created"
puts "|"+("█"*requests_count)+(" "*(requests_number-requests_count))+"|"


Request.create(
  title: "Need old tennis balls",
  request_type: "material",
  location: "Tsim Sha Tsui",
  lat: 22.29716,
  lng: 114.17419,
  description: "Looking for old tennis balls to use to play with my dogs.",
  user_id: User.all.sample.id
)
requests_count += 1
system("clear")
puts "#{requests_count} requests created"
puts "|"+("█"*requests_count)+(" "*(requests_number-requests_count))+"|"


Request.create(
  title: "Looking for someone to mow my lawn",
  request_type: "service",
  location: "Kowloon Tong",
  lat: 22.3345,
  lng: 114.1780,
  description: "Due to my old age, I cant lawn amymore. Looking for someone to help me mow the lawn around my house.",
  user_id: User.all.sample.id
)
requests_count += 1
system("clear")
puts "#{requests_count} requests created"
puts "|"+("█"*requests_count)+(" "*(requests_number-requests_count))+"|"


Request.create(
  title: "Need help for gardening",
  request_type: "service",
  location: "Sha Tin",
  lat: 22.3717,
  lng: 114.1833,
  description: "Trying to plant a peach tree in my backyard. I need help to dig a hole and carry the tree.",
  user_id: User.all.sample.id
)
requests_count += 1
system("clear")
puts "#{requests_count} requests created"
puts "|"+("█"*requests_count)+(" "*(requests_number-requests_count))+"|"


Request.create(
  title: "Need furnitures for new house",
  request_type: "material",
  location: "Po Lam",
  lat: 22.32251,
  lng: 114.25783,
  description: "Just moved in a new house and looking for furnitures to put in my living room. If you have any furnitures you want to get rid let me know.",
  user_id: User.all.sample.id
)
requests_count += 1
system("clear")
puts "#{requests_count} requests created"
puts "|"+("█"*requests_count)+(" "*(requests_number-requests_count))+"|"


Request.create(
  title: "Need help to fix light",
  request_type: "service",
  location: "Aberdeen",
  lat: 22.24200,
  lng: 114.15100,
  description: "The light in my living room broke and I don't know how to replace it.",
  user_id: User.all.sample.id
)
requests_count += 1
system("clear")
puts "#{requests_count} requests created"
puts "|"+("█"*requests_count)+(" "*(requests_number-requests_count))+"|"



puts ""
puts "Enjoy 🥃 !!!"
puts "----------->"