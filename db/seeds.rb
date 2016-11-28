# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
begin
	seed_start = SeedStatus.create(status: true)
rescue ActiveRecord::RecordNotUnique
	if SeedStatus.exists?(status: false)
		p '===Seeding is already done.'
	else
		p '===Seeding is being executed by another instance.'
	end
else
   p '===This is the only one instance that is seeding the data...'
 
   load(Rails.root.join( 'db', 'seeds', "#{Rails.env.downcase}.rb"))
   # load(Rails.root.join( 'db', 'seeds', 'production.rb'))
   seed_done = SeedStatus.create(status: false)
   p '===Seeding is done.'
end