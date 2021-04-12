# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Create Users


#Create Roles
if Role.count == 0
    Role.create(roletype: "Head Admin")
    Role.create(roletype: "Admin")
    Role.create(roletype: "Student")
end

if User.count == 0
    user = User.create(email: "test@gmail.com", first_name: "First", last_name: "Last", password: "test", role_id: Role.find_by_roletype("Student").id)
    user = User.create(email: "test1@gmail.com", first_name: "First1", last_name: "Last1", password: "test", role_id: Role.find_by_roletype("Student").id)
    user = User.create(email: "test2@gmail.com", first_name: "First2", last_name: "Last2", password: "test", role_id: Role.find_by_roletype("Student").id)
    user = User.create(email: "test3@gmail.com", first_name: "First3", last_name: "Last3", password: "test", role_id: Role.find_by_roletype("Student").id)
    admin = User.create(email: "admin@gmail.com", first_name: "AdminFirst", last_name: "AdminLast", password: "admin", role_id: Role.find_by_roletype("Head Admin").id)
end


