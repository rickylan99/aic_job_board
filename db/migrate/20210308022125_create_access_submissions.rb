class CreateAccessSubmissions < ActiveRecord::Migration[6.1]
  def change
    create_table :access_submissions do |t|
      t.string :answers

      t.timestamps
    end
  end
end
