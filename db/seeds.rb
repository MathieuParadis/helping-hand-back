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

User.create(first_name: "Gabriel", last_name: "Green", email: "gabriel.green@yopgmail.com", password: "azerty123", password_confirmation: "azerty123", id_card_url: "https://github.com/MathieuParadis/helping-hand/blob/main/src/assets/images/IDcard.png").id_card.attach(io: File.open('app/assets/images/IDcard.png'), filename: 'IDcard.png')
users_count += 1
system("clear")
puts "#{users_count} users created"
puts "|"+("█"*users_count)+(" "*(users_number-users_count))+"|"

User.create(first_name: "Connie", last_name: "Brown", email: "connie.brown@yopgmail.com", password: "azerty123", password_confirmation: "azerty123", id_card_url: "https://github.com/MathieuParadis/helping-hand/blob/main/src/assets/images/IDcard.png").id_card.attach(io: File.open('app/assets/images/IDcard.png'), filename: 'IDcard.png')
users_count += 1
system("clear")
puts "#{users_count} users created"
puts "|"+("█"*users_count)+(" "*(users_number-users_count))+"|"

User.create(first_name: "Melanie", last_name: "Jones", email: "melanie.jones@yopgmail.com", password: "azerty123", password_confirmation: "azerty123", id_card_url: "https://github.com/MathieuParadis/helping-hand/blob/main/src/assets/images/IDcard.png").id_card.attach(io: File.open('app/assets/images/IDcard.png'), filename: 'IDcard.png')
users_count += 1
system("clear")
puts "#{users_count} users created"
puts "|"+("█"*users_count)+(" "*(users_number-users_count))+"|"



p "Creating Requests"

Request.create(
  title:"In need of 2 blankets",
  request_type: "material",
  location: "Boulder",
  lat: 40.00,
  lng: -105.35,
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
  location: "Boulder",
  lat: 39.95,
  lng: -105.24,
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
  location: "Boulder",
  lat: 40.06,
  lng: -105.26,
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
  location: "Boulder",
  lat: 40.03,
  lng: -105.23,
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
  location: "Boulder",
  lat: 40.08,
  lng: -105.23,
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
  location: "Boulder",
  lat: 40.05,
  lng: -105.14,
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
  location: "Boulder",
  lat: 40.05,
  lng: -105.14,
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
  location: "Boulder",
  lat: 39.97,
  lng: -105.14,
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
  location: "Boulder",
  lat: 40.01,
  lng: -105.26,
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
  location: "Boulder",
  lat: 40.00,
  lng: -105.20,
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