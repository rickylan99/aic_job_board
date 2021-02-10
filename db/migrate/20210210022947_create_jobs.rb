class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :company
      t.string :logo
      t.json :description
      t.json :questions
      t.integer :adminid

      t.timestamps
    end
  end
end
