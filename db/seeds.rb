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
user = User.create(email: "test1@gmail.com", first_name: "First1", last_name: "Last1", password: "test", role_id: Role.find_by_roletype("Student").id)
user = User.create(email: "test2@gmail.com", first_name: "First2", last_name: "Last2", password: "test", role_id: Role.find_by_roletype("Student").id)
user = User.create(email: "test3@gmail.com", first_name: "First3", last_name: "Last3", password: "test", role_id: Role.find_by_roletype("Student").id)
admin = User.create(email: "admin@gmail.com", first_name: "AdminFirst", last_name: "AdminLast", password: "admin", role_id: Role.find_by_roletype("Admin").id)

firm = Firm.create(name: "JP Morgan", industry: "Banking", location: "New York City", 
    description: "JPMorgan Chase & Co. is an American multinational investment bank and financial services holding company headquartered in New York City. JPMorgan Chase is ranked by S&P Global as the largest bank in the United States and the seventh largest bank in the world by total assets, with total assets of US$3.213 trillion.", 
    website: "https://www.jpmorganchase.com/", linkedin: "https://www.linkedin.com/company/jpmorgan/",
    contact_name: "Morgan Scott", contact_email: "morgan.scott@gamil.com", contact_linkedin: "https://www.linkedin.com/company/jpmorgan/")


