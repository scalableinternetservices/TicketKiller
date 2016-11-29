require 'faker'
######################################
# create admin
######################################
User.create!(name:  "Admin",
             email: "admin@admin.org",
             password:              "password",
             password_confirmation: "password",
             admin: true)

######################################
# config 
######################################

total_num_of_users = 500
avg_num_cars_per_user = 3 
total_num_of_officers = 2000

######################################
# create users
######################################

total_num_of_users.times do |n_user|
  puts 'Creating user: user_' + (n_user + 1).to_s
  user = User.create(
    name: "user_" + (n_user + 1).to_s,
    email: "user_" + (n_user + 1).to_s + "@example.com",
    password: "password",
    password_confirmation: "password",
  )
end

######################################
# create cars
######################################
avg_num_cars_per_user.times do |n_car|
  total_num_of_users.times do |n_user|
    puts 'Creating car: car_' + (n_car + 1).to_s + ' for user_' + (n_user + 1).to_s
    car = Car.create(
      user_id: n_user + 1,
      lat: Faker::Address.latitude,
      long: Faker::Address.longitude
    )
  end
end

######################################
# create officers
######################################
total_num_of_officers.times do |n_officer|
  puts 'Creating user: officer_' + (n_officer + 1).to_s
  officer = Officer.create(
  	lat: Faker::Address.latitude,
  	long: Faker::Address.longitude
  )
end
