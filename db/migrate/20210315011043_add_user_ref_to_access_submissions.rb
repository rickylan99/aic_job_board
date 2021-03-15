class AddUserRefToAccessSubmissions < ActiveRecord::Migration[6.1]
  def change
    add_reference :access_submissions, :user, null: false, foreign_key: true
  end
end
