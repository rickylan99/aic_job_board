class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :position
      t.string :location
      t.string :company
      t.string :logo
      t.string :description
      t.string :questions
      t.integer :user_id

      t.timestamps
    end
  end
end
