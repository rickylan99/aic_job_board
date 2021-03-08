class CreateAccessApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :access_applications do |t|
      t.string :questions

      t.timestamps
    end
  end
end
