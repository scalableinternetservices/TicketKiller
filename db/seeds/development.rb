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
total_num_of_officers = 1000

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
# create officers
######################################
total_num_of_officers.times do |n_officer|
  puts 'Creating user: officer_' + (n_officer + 1).to_s
  officer = Officer.create(
  	lat: Faker::Address.latitude,
  	long: Faker::Address.longitude
  )
end
