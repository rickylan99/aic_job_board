class CreateAccessSubmissions < ActiveRecord::Migration[6.1]
  def change
    create_table :access_submissions do |t|
      t.string :email
    t.string :first_name
    t.string :phone_number
    t.string :classification
    t.string :major
    t.string :last_name
    t.string :file_id
    t.string :file_name
    t.text :q1
    t.text :q2
    t.text :q3
    t.text :q4
    end
  end
end
