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

user1 = User.create(first_name: "Gabriel", last_name: "Green", email: "gabriel.green@yopgmail.com", password: "azerty123", password_confirmation: "azerty123", id_card_url: "IDcard.png").id_card.attach(io: File.open('app/assets/images/IDcard.png'), filename: 'IDcard.png')
users_count += 1
system("clear")
puts "#{users_count} users created"
puts "|"+("█"*users_count)+(" "*(users_number-users_count))+"|"

user2 = User.create(first_name: "Connie", last_name: "Brown", email: "connie.brown@yopgmail.com", password: "azerty123", password_confirmation: "azerty123", id_card_url: "IDcard.png").id_card.attach(io: File.open('app/assets/images/IDcard.png'), filename: 'IDcard.png')
users_count += 1
system("clear")
puts "#{users_count} users created"
puts "|"+("█"*users_count)+(" "*(users_number-users_count))+"|"

user3 = User.create(first_name: "Melanie", last_name: "Jones", email: "melanie.jones@yopgmail.com", password: "azerty123", password_confirmation: "azerty123", id_card_url: "IDcard.png").id_card.attach(io: File.open('app/assets/images/IDcard.png'), filename: 'IDcard.png')
users_count += 1
system("clear")
puts "#{users_count} users created"
puts "|"+("█"*users_count)+(" "*(users_number-users_count))+"|"



p "Creating Requests"

Request.create(
  title:"",
  request_type: "",
  location: "",
  lat: ,
  lgn: ,
  description:"azerty123",
)
requests_count += 1
system("clear")
puts "#{requests_count} requests created"
puts "|"+("█"*requests_count)+(" "*(requests_number-requests_count))+"|"


puts ""
puts "Enjoy 🥃 !!!"
puts "----------->"