class AddAccessApplicationRefToAccessSubmissions < ActiveRecord::Migration[6.1]
  def change
    add_reference :access_submissions, :access_application, null: false, foreign_key: true
  end
end
