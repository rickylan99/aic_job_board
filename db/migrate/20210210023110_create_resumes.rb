class CreateResumes < ActiveRecord::Migration[6.1]
  def change
    create_table :resumes do |t|
      t.integer :studentid
      t.datetime :dateupdate

      t.timestamps
    end
  end
end
