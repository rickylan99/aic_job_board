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
    admin = User.create(email: "tamuaic@gmail.com", first_name: "Head", last_name: "Admin", password: "admin", role_id: Role.find_by_roletype("Head Admin").id)
end

if MemberResource.count == 0 
    MemberResource.create(title: "How to Use AIC Access", video_url: "https://www.youtube.com/embed/l9N4xtQg2t4" )
    MemberResource.create(title: "Networking for an Internship", video_url: "https://www.youtube.com/embed/adCtqkzE_LI")
    MemberResource.create(title: "Cold Emailing & Calling", video_url: "https://www.youtube.com/embed/adCtqkzE_LI")
    MemberResource.create(title: "Building Your Resume", video_url: "https://www.youtube.com/embed/adCtqkzE_LI")
end


