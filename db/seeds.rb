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
    admin = User.create(email: "admin@gmail.com", first_name: "AdminFirst", last_name: "AdminLast", password: "admin", role_id: Role.find_by_roletype("Head Admin").id)
end


