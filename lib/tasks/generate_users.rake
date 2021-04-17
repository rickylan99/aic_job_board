# frozen_string_literal: true

desc 'This task generates 100 users'
task generate_users: :environment do
  puts 'Generating users...'

  public_id = "shfgjkg7sc0bkyvbc0ca"

  for i in 1..10 do
    puts i
    User.create(email: "test_user#{i}@gmail.com", password: "test", first_name: "User#{i}", last_name: "Last",
                role_id: Role.find_by(roletype: 'Student').id).documents.new(public_id: public_id, file_name: "Z.pdf", 
                documenttype: 'resume').save
  end

  puts 'Done.'
end
