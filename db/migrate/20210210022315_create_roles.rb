class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.integer :roleid
      t.string :roletype

      t.timestamps
    end
  end
end
