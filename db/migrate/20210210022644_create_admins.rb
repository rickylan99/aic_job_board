class CreateAdmins < ActiveRecord::Migration[6.1]
  def change
    create_table :admins do |t|
      t.integer :userid
      t.string :firstname
      t.string :lastname
      t.integer :jobid

      t.timestamps
    end
  end
end
