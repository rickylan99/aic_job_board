class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :position
      t.string :location
      t.string :description
      t.string :classifications
      t.date :deadline

      t.timestamps
    end
  end
end
