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

# user1 = User.create(first_name: "Gabriel", last_name: "Green", email: "gabriel.green@yopgmail.com", password: "azerty123", password_confirmation: "azerty123").id_card.attach(io: File.open('app/assets/images/IDcard.png'), filename: 'IDcard.png')
User.new(first_name: "Gabriel", last_name: "Green")


# users_count += 1
# system("clear")
# puts "#{users_count} users created"
# puts "|"+("█"*users_count)+(" "*(users_number-users_count))+"|"







puts ""
puts "Enjoy 🥃 !!!"
puts "----------->"