# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create the main user
main_user_email = "alessio.santo@pazienti.it"
User.create!(:email => main_user_email, :password => "pazienti") unless User.find_by_email(main_user_email).present?
