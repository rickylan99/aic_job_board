class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :company
      t.string :logo
      t.string :description
      t.string :questions
      t.integer :userid

      t.timestamps
    end
  end
end