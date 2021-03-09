class CreateAccessSubmissions < ActiveRecord::Migration[6.1]
  def change
    create_table :access_submissions do |t|
      t.string :answers
      t.integer :user_id
      t.integer :accessapplication_id

      t.timestamps
    end
  end
end
