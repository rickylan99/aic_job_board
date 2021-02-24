# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Create Users
user = User.create(email: "test@gmail.com", password: "test", role_id: 1)

#Create Roles
Role.create(roletype: "Admin")
Role.create(roletype: "Student")

#Create Jobs
Job.create(company: "Dell", logo: "PC go burr", description: "Please apply online", questions: "How are you", user_id: 1)
Job.create(company: "JP Morgan", logo: "JP", description: "Please apply online", questions: "How are you", user_id: 1)
Job.create(company: "Whataburger", logo: "Whata", description: "Please apply online", questions: "How are you", user_id: 1)