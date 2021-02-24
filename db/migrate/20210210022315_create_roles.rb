class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.integer :role_id
      t.string :roletype

      t.timestamps
    end
  end
end
