# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Create Users


#Create Roles
Role.create(roletype: "Admin")
Role.create(roletype: "Student")


user = User.create(email: "test@gmail.com", first_name: "First", last_name: "Last", password: "test", role_id: Role.find_by_roletype("Student").id)
admin = User.create(email: "admin@gmail.com", first_name: "Admin", last_name: "Last", password: "admin", role_id: Role.find_by_roletype("Admin").id)

#Create Jobs
Job.create(title: "Finance Intern", position: 'Intern Part-Time', location: "San Francisco", company: "Dell", logo: "PC go burr", description: "Please apply online", questions: "How are you", user_id: 1)
Job.create(title: "Invest Intern", position: "Intern", location: "New York City", company: "JP Morgan", logo: "JP", description: "Please apply online", questions: "How are you", user_id: 1)
Job.create(title: "Patty Melt Chef", position: "Goat", location: "College Station", company: "Whataburger", logo: "Whata", description: "Please apply online", questions: "How are you", user_id: 1)