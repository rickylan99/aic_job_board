class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.integer :userid
      t.string :firstname
      t.string :lastname
      t.integer :classyear

      t.timestamps
    end
  end
end
