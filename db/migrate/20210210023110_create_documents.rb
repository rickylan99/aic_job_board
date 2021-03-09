class CreateDocuments < ActiveRecord::Migration[6.1]
  def change
    create_table :documents do |t|
      t.integer :user_id
      t.string :file
      t.string :documenttype
      t.datetime :dateupdate

      t.timestamps
    end
  end
end
